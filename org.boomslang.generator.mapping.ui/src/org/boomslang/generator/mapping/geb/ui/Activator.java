package org.boomslang.generator.mapping.geb.ui;

import org.apache.log4j.Logger;
import org.eclipse.ui.plugin.AbstractUIPlugin;
import org.eclipse.xtext.ui.shared.SharedStateModule;
import org.eclipse.xtext.util.Modules2;
import org.osgi.framework.BundleContext;

import org.boomslang.generator.mapping.BMappingGeneratorModule;
import org.boomslang.dsl.mapping.MappingRuntimeModule;
import org.boomslang.dsl.mapping.ui.MappingUiModule;

import com.google.inject.Guice;
import com.google.inject.Injector;
import com.google.inject.Module;

/**
 * The activator class controls the plug-in life cycle
 */
public class Activator extends AbstractUIPlugin {
	private Injector injector;
	private static Activator INSTANCE;
	
	public Injector getInjector() {
		return injector;
	}
	
	/*
	 * (non-Javadoc)
	 * @see org.eclipse.ui.plugin.AbstractUIPlugin#start(org.osgi.framework.BundleContext)
	 */
	public void start(BundleContext context) throws Exception {
		super.start(context);
		 INSTANCE = this;
	        try {
	            injector = Guice.createInjector(Modules2.mixin(new MappingRuntimeModule(), new BMappingGeneratorModule(), new BMappingGeneratorGebUIModule(this), new SharedStateModule(),((Module)new MappingUiModule(this))));
	        } catch (Exception e) {
	            Logger.getLogger(getClass()).error(e.getMessage(), e); 
	            throw e;
	        }
	}

	/*
	 * (non-Javadoc)
	 * @see org.eclipse.ui.plugin.AbstractUIPlugin#stop(org.osgi.framework.BundleContext)
	 */
	public void stop(BundleContext context) throws Exception {
		injector=null;
		super.stop(context);
	}

    public static Activator getInstance() {
        return INSTANCE;
    }

}
