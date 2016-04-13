-- Student Name: Ivan David Diaz Sanchez
-- Student ID: A01371166
-- Token Ring Programming Activity

local matrix = require("matrix")

local lambda = 0.01
local mu = 0.1
local omega = 1.0

local states = 135

function main()
  local q = matrix:new(token_ring_mat())
  local qt = matrix.transpose(q)
  local qt_inv = matrix.invert(qt)
  local pi_vector = calculate_sys_pi(qt_inv)

  print("Pi Values Vector:\n")

  for i = 1, states do
    print(string.format("P%d [%.8f]", i, pi_vector[i]))
  end
end

function calculate_sys_pi(inv_mtx)
  local pi_vec = {}
  for i = 1, states do
    pi_vec[i] = inv_mtx[i][states]
  end
  return pi_vec
end

function token_ring_mat()
  local tr = {}

  for i = 1, states do
    tr[i] = {}
    for j = 1, states do
      tr[i][j] = 0
    end
  end

  -- Lambda Transitions (Generate Packets)

  tr[4][10]    =  tr[4][10]   + lambda
  tr[4][21]    =  tr[4][21]   + lambda
  tr[4][52]    =  tr[4][52]   + lambda
  tr[5][11]    =  tr[5][11]   + lambda
  tr[5][22]    =  tr[5][22]   + lambda
  tr[5][53]    =  tr[5][53]   + lambda
  tr[6][12]    =  tr[6][12]   + lambda
  tr[6][23]    =  tr[6][23]   + lambda
  tr[6][54]    =  tr[6][54]   + lambda
  tr[10][15]   = tr[10][15]   + lambda
  tr[10][27]   = tr[10][27]   + lambda
  tr[10][58]   = tr[10][58]   + lambda
  tr[11][16]   = tr[11][16]   + lambda
  tr[11][28]   = tr[11][28]   + lambda
  tr[11][59]   = tr[11][59]   + lambda
  tr[12][17]   = tr[12][17]   + lambda
  tr[12][29]   = tr[12][29]   + lambda
  tr[12][60]   = tr[12][60]   + lambda
  tr[15][32]   = tr[15][32]   + lambda
  tr[15][63]   = tr[15][63]   + lambda
  tr[16][33]   = tr[16][33]   + lambda
  tr[16][64]   = tr[16][64]   + lambda
  tr[17][34]   = tr[17][34]   + lambda
  tr[17][65]   = tr[17][65]   + lambda
  tr[21][27]   = tr[21][27]   + lambda
  tr[21][37]   = tr[21][37]   + lambda
  tr[21][69]   = tr[21][69]   + lambda
  tr[22][28]   = tr[22][28]   + lambda
  tr[22][38]   = tr[22][38]   + lambda
  tr[22][70]   = tr[22][70]   + lambda
  tr[23][29]   = tr[23][29]   + lambda
  tr[23][39]   = tr[23][39]   + lambda
  tr[23][71]   = tr[23][71]   + lambda
  tr[27][32]   = tr[27][32]   + lambda
  tr[27][42]   = tr[27][42]   + lambda
  tr[27][75]   = tr[27][75]   + lambda
  tr[28][33]   = tr[28][33]   + lambda
  tr[28][43]   = tr[28][43]   + lambda
  tr[28][76]   = tr[28][76]   + lambda
  tr[29][34]   = tr[29][34]   + lambda
  tr[29][44]   = tr[29][44]   + lambda
  tr[29][77]   = tr[29][77]   + lambda
  tr[32][46]   = tr[32][46]   + lambda
  tr[32][80]   = tr[32][80]   + lambda
  tr[33][47]   = tr[33][47]   + lambda
  tr[33][81]   = tr[33][81]   + lambda
  tr[34][48]   = tr[34][48]   + lambda
  tr[34][82]   = tr[34][82]   + lambda
  tr[37][42]   = tr[37][42]   + lambda
  tr[37][85]   = tr[37][85]   + lambda
  tr[38][43]   = tr[38][43]   + lambda
  tr[38][86]   = tr[38][86]   + lambda
  tr[39][44]   = tr[39][44]   + lambda
  tr[39][87]   = tr[39][87]   + lambda
  tr[42][46]   = tr[42][46]   + lambda
  tr[42][90]   = tr[42][90]   + lambda
  tr[43][47]   = tr[43][47]   + lambda
  tr[43][91]   = tr[43][91]   + lambda
  tr[44][48]   = tr[44][48]   + lambda
  tr[44][92]   = tr[44][92]   + lambda
  tr[46][94]   = tr[46][94]   + lambda
  tr[47][95]   = tr[47][95]   + lambda
  tr[48][96]   = tr[48][96]   + lambda
  tr[52][58]   = tr[52][58]   + lambda
  tr[52][69]   = tr[52][69]   + lambda
  tr[52][99]   = tr[52][99]   + lambda
  tr[53][59]   = tr[53][59]   + lambda
  tr[53][70]   = tr[53][70]   + lambda
  tr[53][100]  = tr[53][100]  + lambda
  tr[54][60]   = tr[54][60]   + lambda
  tr[54][71]   = tr[54][71]   + lambda
  tr[54][101]  = tr[54][101]  + lambda
  tr[58][63]   = tr[58][63]   + lambda
  tr[58][75]   = tr[58][75]   + lambda
  tr[58][104]  = tr[58][104]  + lambda
  tr[59][64]   = tr[59][64]   + lambda
  tr[59][76]   = tr[59][76]   + lambda
  tr[59][105]  = tr[59][105]  + lambda
  tr[60][65]   = tr[60][65]   + lambda
  tr[60][77]   = tr[60][77]   + lambda
  tr[60][106]  = tr[60][106]  + lambda
  tr[63][80]   = tr[63][80]   + lambda
  tr[63][108]  = tr[63][108]  + lambda
  tr[64][81]   = tr[64][81]   + lambda
  tr[64][109]  = tr[64][109]  + lambda
  tr[65][82]   = tr[65][82]   + lambda
  tr[65][110]  = tr[65][110]  + lambda
  tr[69][75]   = tr[69][75]   + lambda
  tr[69][85]   = tr[69][85]   + lambda
  tr[69][113]  = tr[69][113]  + lambda
  tr[70][76]   = tr[70][76]   + lambda
  tr[70][86]   = tr[70][86]   + lambda
  tr[70][114]  = tr[70][114]  + lambda
  tr[71][77]   = tr[71][77]   + lambda
  tr[71][87]   = tr[71][87]   + lambda
  tr[71][115]  = tr[71][115]  + lambda
  tr[75][80]   = tr[75][80]   + lambda
  tr[75][90]   = tr[75][90]   + lambda
  tr[75][118]  = tr[75][118]  + lambda
  tr[76][81]   = tr[76][81]   + lambda
  tr[76][91]   = tr[76][91]   + lambda
  tr[76][119]  = tr[76][119]  + lambda
  tr[77][82]   = tr[77][82]   + lambda
  tr[77][92]   = tr[77][92]   + lambda
  tr[77][120]  = tr[77][120]  + lambda
  tr[80][94]   = tr[80][94]   + lambda
  tr[80][122]  = tr[80][122]  + lambda
  tr[81][95]   = tr[81][95]   + lambda
  tr[81][123]  = tr[81][123]  + lambda
  tr[82][96]   = tr[82][96]   + lambda
  tr[82][124]  = tr[82][124]  + lambda
  tr[85][90]   = tr[85][90]   + lambda
  tr[85][126]  = tr[85][126]  + lambda
  tr[86][91]   = tr[86][91]   + lambda
  tr[86][127]  = tr[86][127]  + lambda
  tr[87][92]   = tr[87][92]   + lambda
  tr[87][128]  = tr[87][128]  + lambda
  tr[90][94]   = tr[90][94]   + lambda
  tr[90][130]  = tr[90][130]  + lambda
  tr[91][95]   = tr[91][95]   + lambda
  tr[91][131]  = tr[91][131]  + lambda
  tr[92][96]   = tr[92][96]   + lambda
  tr[92][132]  = tr[92][132]  + lambda
  tr[94][133]  = tr[94][133]  + lambda
  tr[95][134]  = tr[95][134]  + lambda
  tr[96][135]  = tr[96][135]  + lambda
  tr[99][104]  = tr[99][104]  + lambda
  tr[99][113]  = tr[99][113]  + lambda
  tr[100][105] = tr[100][105] + lambda
  tr[100][114] = tr[100][114] + lambda
  tr[101][106] = tr[101][106] + lambda
  tr[101][115] = tr[101][115] + lambda
  tr[104][108] = tr[104][108] + lambda
  tr[104][118] = tr[104][118] + lambda
  tr[105][109] = tr[105][109] + lambda
  tr[105][119] = tr[105][119] + lambda
  tr[106][110] = tr[106][110] + lambda
  tr[106][120] = tr[106][120] + lambda
  tr[108][122] = tr[108][122] + lambda
  tr[109][123] = tr[109][123] + lambda
  tr[110][124] = tr[110][124] + lambda
  tr[113][118] = tr[113][118] + lambda
  tr[113][126] = tr[113][126] + lambda
  tr[114][119] = tr[114][119] + lambda
  tr[114][127] = tr[114][127] + lambda
  tr[115][120] = tr[115][120] + lambda
  tr[115][128] = tr[115][128] + lambda
  tr[118][122] = tr[118][122] + lambda
  tr[118][130] = tr[118][130] + lambda
  tr[119][123] = tr[119][123] + lambda
  tr[119][131] = tr[119][131] + lambda
  tr[120][124] = tr[120][124] + lambda
  tr[120][132] = tr[120][132] + lambda
  tr[122][133] = tr[122][133] + lambda
  tr[123][134] = tr[123][134] + lambda
  tr[124][135] = tr[124][135] + lambda
  tr[126][130] = tr[126][130] + lambda
  tr[127][131] = tr[127][131] + lambda
  tr[128][132] = tr[128][132] + lambda
  tr[130][133] = tr[130][133] + lambda
  tr[131][134] = tr[131][134] + lambda
  tr[132][135] = tr[132][135] + lambda

  -- Mu Transitions (Send Packets)

  tr[133][93]  = tr[133][93]  + mu
  tr[134][121] = tr[134][121] + mu
  tr[135][129] = tr[135][129] + mu
  tr[130][89]  = tr[130][89]  + mu
  tr[131][117] = tr[131][117] + mu
  tr[132][125] = tr[132][125] + mu
  tr[126][84]  = tr[126][84]  + mu
  tr[127][112] = tr[127][112] + mu
  tr[122][79]  = tr[122][79]  + mu
  tr[123][107] = tr[123][107] + mu
  tr[124][116] = tr[124][116] + mu
  tr[118][74]  = tr[118][74]  + mu
  tr[119][103] = tr[119][103] + mu
  tr[120][111] = tr[120][111] + mu
  tr[113][68]  = tr[113][68]  + mu
  tr[114][98]  = tr[114][98]  + mu
  tr[108][62]  = tr[108][62]  + mu
  tr[110][102] = tr[110][102] + mu
  tr[104][57]  = tr[104][57]  + mu
  tr[106][97]  = tr[106][97]  + mu
  tr[99][51]   = tr[99][51]   + mu
  tr[94][45]   = tr[94][45]   + mu
  tr[95][78]   = tr[95][78]   + mu
  tr[96][88]   = tr[96][88]   + mu
  tr[90][41]   = tr[90][41]   + mu
  tr[91][73]   = tr[91][73]   + mu
  tr[92][83]   = tr[92][83]   + mu
  tr[85][36]   = tr[85][36]   + mu
  tr[86][67]   = tr[86][67]   + mu
  tr[80][31]   = tr[80][31]   + mu
  tr[81][61]   = tr[81][61]   + mu
  tr[82][72]   = tr[82][72]   + mu
  tr[75][26]   = tr[75][26]   + mu
  tr[76][56]   = tr[76][56]   + mu
  tr[77][66]   = tr[77][66]   + mu
  tr[69][20]   = tr[69][20]   + mu
  tr[70][50]   = tr[70][50]   + mu
  tr[63][14]   = tr[63][14]   + mu
  tr[65][55]   = tr[65][55]   + mu
  tr[58][9]    = tr[58][9]    + mu
  tr[60][49]   = tr[60][49]   + mu
  tr[52][3]    = tr[52][3]    + mu
  tr[47][30]   = tr[47][30]   + mu
  tr[48][40]   = tr[48][40]   + mu
  tr[43][25]   = tr[43][25]   + mu
  tr[44][35]   = tr[44][35]   + mu
  tr[38][19]   = tr[38][19]   + mu
  tr[33][13]   = tr[33][13]   + mu
  tr[34][24]   = tr[34][24]   + mu
  tr[28][8]    = tr[28][8]    + mu
  tr[29][18]   = tr[29][18]   + mu
  tr[22][2]    = tr[22][2]    + mu
  tr[17][7]    = tr[17][7]    + mu
  tr[12][1]    = tr[12][1]    + mu

  -- Omega Transitions (Pass The Token)

  tr[1][4]     = tr[1][4]     + omega
  tr[2][6]     = tr[2][6]     + omega
  tr[3][5]     = tr[3][5]     + omega
  tr[4][5]     = tr[4][5]     + omega
  tr[5][6]     = tr[5][6]     + omega
  tr[6][4]     = tr[6][4]     + omega
  tr[7][10]    = tr[7][10]    + omega
  tr[8][12]    = tr[8][12]    + omega
  tr[9][11]    = tr[9][11]    + omega
  tr[10][11]   = tr[10][11]   + omega
  tr[11][12]   = tr[11][12]   + omega
  tr[13][17]   = tr[13][17]   + omega
  tr[14][16]   = tr[14][16]   + omega
  tr[15][16]   = tr[15][16]   + omega
  tr[16][17]   = tr[16][17]   + omega
  tr[18][21]   = tr[18][21]   + omega
  tr[19][23]   = tr[19][23]   + omega
  tr[20][22]   = tr[20][22]   + omega
  tr[21][22]   = tr[21][22]   + omega
  tr[23][21]   = tr[23][21]   + omega
  tr[24][27]   = tr[24][27]   + omega
  tr[25][29]   = tr[25][29]   + omega
  tr[26][28]   = tr[26][28]   + omega
  tr[27][28]   = tr[27][28]   + omega
  tr[30][34]   = tr[30][34]   + omega
  tr[31][33]   = tr[31][33]   + omega
  tr[32][33]   = tr[32][33]   + omega
  tr[35][37]   = tr[35][37]   + omega
  tr[36][38]   = tr[36][38]   + omega
  tr[37][38]   = tr[37][38]   + omega
  tr[39][37]   = tr[39][37]   + omega
  tr[40][42]   = tr[40][42]   + omega
  tr[41][43]   = tr[41][43]   + omega
  tr[42][43]   = tr[42][43]   + omega
  tr[45][47]   = tr[45][47]   + omega
  tr[46][47]   = tr[46][47]   + omega
  tr[49][52]   = tr[49][52]   + omega
  tr[50][54]   = tr[50][54]   + omega
  tr[51][53]   = tr[51][53]   + omega
  tr[53][54]   = tr[53][54]   + omega
  tr[54][52]   = tr[54][52]   + omega
  tr[55][58]   = tr[55][58]   + omega
  tr[56][60]   = tr[56][60]   + omega
  tr[57][59]   = tr[57][59]   + omega
  tr[59][60]   = tr[59][60]   + omega
  tr[61][65]   = tr[61][65]   + omega
  tr[62][64]   = tr[62][64]   + omega
  tr[64][65]   = tr[64][65]   + omega
  tr[66][69]   = tr[66][69]   + omega
  tr[67][71]   = tr[67][71]   + omega
  tr[68][70]   = tr[68][70]   + omega
  tr[71][69]   = tr[71][69]   + omega
  tr[72][75]   = tr[72][75]   + omega
  tr[73][77]   = tr[73][77]   + omega
  tr[74][76]   = tr[74][76]   + omega
  tr[78][82]   = tr[78][82]   + omega
  tr[79][81]   = tr[79][81]   + omega
  tr[83][85]   = tr[83][85]   + omega
  tr[84][86]   = tr[84][86]   + omega
  tr[87][85]   = tr[87][85]   + omega
  tr[88][90]   = tr[88][90]   + omega
  tr[89][91]   = tr[89][91]   + omega
  tr[93][95]   = tr[93][95]   + omega
  tr[97][99]   = tr[97][99]   + omega
  tr[98][101]  = tr[98][101]  + omega
  tr[100][101] = tr[100][101] + omega
  tr[101][99]  = tr[101][99]  + omega
  tr[102][104] = tr[102][104] + omega
  tr[103][106] = tr[103][106] + omega
  tr[105][106] = tr[105][106] + omega
  tr[107][110] = tr[107][110] + omega
  tr[109][110] = tr[109][110] + omega
  tr[111][113] = tr[111][113] + omega
  tr[112][115] = tr[112][115] + omega
  tr[115][113] = tr[115][113] + omega
  tr[116][118] = tr[116][118] + omega
  tr[117][120] = tr[117][120] + omega
  tr[121][124] = tr[121][124] + omega
  tr[125][126] = tr[125][126] + omega
  tr[128][126] = tr[128][126] + omega
  tr[129][130] = tr[129][130] + omega

  -- Define values for self-transitions

  for j = 1, states do
    sum = 0
    for k = 1, states do
      sum = sum + tr[j][k]
    end
    tr[j][j] = sum * -1
  end

  for i = 1, states do
    tr[i][states] = 1
  end

  return tr
end

main()
