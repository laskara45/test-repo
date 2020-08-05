function [odd_number_collection, whole_lyrics] = Beer
Repeat_Lyric_1 = 'bottles of beer on the wall';
Repeat_Lyric_2 = 'bottles of beer';
Repeat_Lyric_3 = 'Take one down and pass it around';
Comma = ',';
Period = '.';

Limit_Lyric_1 = 'no more bottles of beer on the wall';
Limit_Lyric_2 = 'no more bottles of beer';
Limit_Lyric_3 = 'Go to the store and buy some more, 99 bottles of beer on the wall';

whole_lyrics = cell(1);
Z = 1:100;
for i = 1:length(Z)
    Z(i) = 100 - i;
end

odd_number_collection = [];
for i = 1:length(Z)
    T = num2str(Z(i));
    s = Z(i)-1;
    S = num2str(s);
    if s == 1
        W = [T ' ' Repeat_Lyric_1 Comma ' ' T ' ' Repeat_Lyric_2 Period];
        F = [Repeat_Lyric_3 Comma ' ' '1 bottle of beer on the wall' Period];
        whole_lyrics{1,i} = char(W, F);
        
        W = ['1 bottle of beer on the wall' Comma ' ' '1 bottle of beer' Period];
        F = [Repeat_Lyric_3 Comma ' ' 'no more bottles of beer on the wall' Period];
        whole_lyrics{1,(i+1)} = char(W,F);
        odd_number_collection = [odd_number_collection 1];
        break
    end
    W = [T ' ' Repeat_Lyric_1 Comma ' ' T ' ' Repeat_Lyric_2 Period];
    F = [Repeat_Lyric_3 Comma ' ' S ' ' Repeat_Lyric_1 Period];
    whole_lyrics{1,i} = char(W, F);
    
    if rem(Z(i),2) == 1
        odd_number_collection = [odd_number_collection Z(i)];
    end
    
end

end_line_1 = ['No more bottles of beer on the wall, no more bottles of beer' Period];
end_line_2 = ['Go to the store and buy some more, 99 bottles of beer on the wall' Period];

whole_lyrics{1,(i+2)} = char(end_line_1, end_line_2);
whole_lyrics = whole_lyrics';
odd_number_collection = [odd_number_collection 99]';

Lyrics = cell2table(whole_lyrics);
writetable(Lyrics,'99 bottles of beer on the wall.txt');
end

