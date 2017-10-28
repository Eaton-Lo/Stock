package entry;
import entry.TemplateConfig;
import job.ConnectorRegisterJob;
import job.exampleJob;

public class ConfigSupport extends TemplateConfig {

	@Override
    public void configConstant() {
		super.configConstant();
		// 是否要開啟 job scheduler
		enableScheduler = false;
    	//下面可增加要執行不同的job排程
		//jobs.add(exampleJob.class);

    }

}
