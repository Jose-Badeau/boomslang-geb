package org.boomslang.generator.feature.ui;

import org.eclipse.jface.dialogs.IDialogSettings;
import org.eclipse.ui.plugin.AbstractUIPlugin;
import org.eclipse.xtext.generator.IOutputConfigurationProvider;
import org.eclipse.xtext.service.AbstractGenericModule;

import org.boomslang.generator.feature.ui.GebOutputConfigurationProvider;

import com.google.inject.Binder;

public class BFeatureGeneratorGebUIModule extends AbstractGenericModule {
	private final AbstractUIPlugin plugin;
    
    public BFeatureGeneratorGebUIModule (AbstractUIPlugin plugin) {
        this.plugin = plugin;
    }
 
    @Override
    public void configure(Binder binder) {
        super.configure(binder);
        binder.bind(AbstractUIPlugin.class).toInstance(plugin);
        binder.bind(IDialogSettings.class).toInstance(plugin.getDialogSettings());
    }
    /**
     * Bind the JavaProjectBasedBuilderParticipant in order to invoke the generator during the build.
     */
	public Class<? extends org.eclipse.xtext.builder.IXtextBuilderParticipant> bindIXtextBuilderParticipant() {
       return org.eclipse.xtext.builder.BuilderParticipant.class;
    }
	
	public Class<? extends IOutputConfigurationProvider> bindIOutputConfigurationProvider() {
		return GebOutputConfigurationProvider.class;
	}
	
    public org.eclipse.core.resources.IWorkspaceRoot bindIWorkspaceRootToInstance() {
        return org.eclipse.core.resources.ResourcesPlugin.getWorkspace().getRoot();
    }
}
