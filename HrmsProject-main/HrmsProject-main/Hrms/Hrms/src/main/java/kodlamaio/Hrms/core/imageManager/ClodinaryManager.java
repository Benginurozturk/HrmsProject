package kodlamaio.Hrms.core.imageManager;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;

import kodlamaio.Hrms.core.utilities.results.DataResult;
import kodlamaio.Hrms.core.utilities.results.SuccessDataResult;

@Service
public class ClodinaryManager implements UploadService{


    private Cloudinary cloudinary;
    
    @Autowired
    public ClodinaryManager(Cloudinary cloudinary) {
        this.cloudinary = cloudinary;
    }
    
    @SuppressWarnings("rawtypes")
	@Override
    public DataResult<Map> upload(MultipartFile multiPartfile) {

        Map uploadResult = null;

        try {
            File file = convert(multiPartfile);
            uploadResult = this.cloudinary.uploader().upload(file, ObjectUtils.emptyMap());
            file.delete();
        }catch (Exception e){
            e.printStackTrace();
        }

        return new SuccessDataResult<Map>(uploadResult);
    }

    private File convert(MultipartFile multipartFile) throws IOException {
        File file = new File(multipartFile.getOriginalFilename());
        FileOutputStream stream = new FileOutputStream(file);
        stream.write(multipartFile.getBytes());
        stream.close();

        return file;
    } 
}
