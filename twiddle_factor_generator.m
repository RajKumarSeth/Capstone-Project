clc
import mlreportgen.dom.*
setDefaultNumberFormat("%0.4f");
fft_length = input('Enter FFT length:');

for mm = 0:1:(fft_length-1)
    theta = (-2*pi*mm*1/fft_length);
 
    
    twiddle(mm+1) = cos(theta) + (1i*(sin(theta)));

    real_twiddle = real(twiddle);
    im_twiddle = imag(twiddle);
    
    
end
twid_fact=[real_twiddle ; im_twiddle]'
fileID = fopen('C:\Users\prana\Desktop\twiddle_factor.txt','w');
fprintf(fileID,'%.4f %.4f \n',[real_twiddle ; im_twiddle]);
fclose(fileID);
#
