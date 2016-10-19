function vocabList = getVocabList()
%   返回敏感词汇的列表
%   读取vocab.txt内容

fid = fopen('vocab.txt');
n = 1899;   %词汇总数@
vocabList = cell(n,1);
for i = 1:n
    fscanf(fid,'%d',1);
    vocabList{i} = fscanf(fid,'%s',1);
end
fclose(fid);

end

