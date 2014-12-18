/*Copyright 2011 Blue River Interactive

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
*/
component  extends="mura.plugin.pluginGenericEventHandler" output="false"
{

	public void function onApplicationLoad($){
		var siteManager=getBean("settingsManager");
	  	siteManager.injectMethod("createCacheFactory",createCacheFactory);	

		var rs=variables.pluginConfig.getAssignedSites();
		var cacheStruct={};
		for(var i=1; i <= rs.recordcount; i++){
			cacheStruct={
				data=createCacheFactory(name='data',siteid=rs.siteid[i]),
				output=createCacheFactory(name='output',siteid=rs.siteid[i])
			};

			siteManager.getSite(rs.siteid).setCacheFactories(cacheStruct);	
		}
	}
	
	public any function createCacheFactory(){
		return new cacheFactory(argumentCollection=arguments); 
	}	
	


}
