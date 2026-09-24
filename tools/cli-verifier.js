#!/usr/bin/env node
/**
 * CloudPost 存证验证命令行工具
 * 用法：node cli-verifier.js --file 加密文件.enc --key 密钥 [--ots 时间戳文件.ots]
 */

const fs = require('fs');
const crypto = require('crypto');
const { Command } = require('commander');

const program = new Command();

program
  .name('cloudpost-verifier')
  .description('验证 CloudPost 数字存证文件')
  .requiredOption('-f, --file <path>', '加密的 JSON 文件 (.enc)')
  .requiredOption('-k, --key <string>', '解密密钥')
  .option('-o, --ots <path>', 'OTS 时间戳文件')
  .parse(process.argv);

const options = program.opts();

function decryptFile(filePath, key) {
  const encrypted = fs.readFileSync(filePath, 'base64');
  // 假设你使用 AES-256-CBC，这里需要与加密时保持一致
  const decipher = crypto.createDecipheriv(
    'aes-256-cbc',
    crypto.scryptSync(key, 'salt', 32),
    Buffer.alloc(16, 0) // 16字节 IV，需与加密时一致
  );
  
  let decrypted = decipher.update(encrypted, 'base64', 'utf8');
  decrypted += decipher.final('utf8');
  return decrypted;
}

function verifyHash(data) {
  return crypto.createHash('sha256').update(data).digest('hex');
}

try {
  console.log('🔍 开始验证 CloudPost 存证文件...\n');
  
  // 1. 解密文件
  console.log('📦 解密文件中...');
  const decrypted = decryptFile(options.file, options.key);
  
  // 2. 解析 JSON
  const json = JSON.parse(decrypted);
  
  // 3. 计算哈希
  const hash = verifyHash(decrypted);
  
  // 4. 输出结果
  console.log('✅ 文件解密成功！\n');
  console.log('========================================');
  console.log('📄 存证元数据');
  console.log('========================================');
  console.log(`主题：${json.physical_object?.theme || '未知'}`);
  console.log(`格式：${json.physical_object?.format || '未知'}`);
  console.log(`发行：${json.physical_object?.issue_date || '未知'}`);
  console.log(`挂号信：${json.physical_object?.tracking_number || '未知'}`);
  console.log(`收件人：${json.physical_object?.recipient_info?.name || '未知'}`);
  console.log(`存证时间：${json.evidence_chain?.[0]?.timestamp || '未知'}`);
  console.log(`位置：${json.evidence_chain?.[0]?.location || '未知'}`);
  console.log(`文件哈希：${hash}`);
  
  console.log('\n========================================');
  console.log('🔗 证据链');
  console.log('========================================');
  json.evidence_chain?.forEach((evidence, i) => {
    console.log(`${i+1}. ${evidence.type}: ${evidence.timestamp}`);
    if (evidence.hash) console.log(`   哈希：${evidence.hash.substring(0, 16)}...`);
  });
  
  if (options.ots) {
    console.log('\n========================================');
    console.log('⏳ OTS 时间戳验证');
    console.log('========================================');
    console.log(`请使用以下命令验证时间戳：`);
    console.log(`  ots verify "${options.ots}"`);
    console.log(`或访问 https://opentimestamps.org`);
  }
  
  console.log('\n========================================');
  console.log('✅ 验证完成！');
  console.log('请核对：');
  console.log('1. 物理信封条码是否与上方一致');
  console.log('2. 时间戳是否真实有效');
  console.log('3. 证据链文件哈希可独立验证');
  
} catch (error) {
  console.error('❌ 验证失败：', error.message);
  process.exit(1);
}
