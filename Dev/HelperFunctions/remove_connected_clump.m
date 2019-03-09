function [updated_idx] = remove_connected_clump(cc, idx, img, count)
intensity_list = zeros(1, numel(cc));

for i = 1 : numel(cc)
    intensity_list(i) = img(idx{cc(i)}(1));
end
sorted_list = sort(intensity_list);
indices = sorted_list(1:count);

updated_idx = zeros(1, numel(indices));
for i = 1 : numel(indices)
    index = find(intensity_list == indices(i));
    cc_index = cc(index);
    if size(cc_index,2) ~= 1
        cc_index = cc_index(1);
    end
    updated_idx(i) = cc_index;
end