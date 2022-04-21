<!-- The contents of this file are subject to the license and copyright -->
<!-- detailed in the LICENSE and NOTICE files at the root of the source -->
<!-- tree and available online at -->
<!-- http://www.dspace.org/license/ -->
<!-- Rendering specific to the navigation (options) -->
<!-- Author: art.lowel at atmire.com -->
<!-- Author: lieven.droogmans at atmire.com -->
<!-- Author: ben at atmire.com -->
<!-- Author: Alexey Maslov -->
<xsl:stylesheet xmlns:i18n="http://apache.org/cocoon/i18n/2.1" xmlns:dri="http://di.tamu.edu/DRI/1.0/" xmlns:mets="http://www.loc.gov/METS/" xmlns:xlink="http://www.w3.org/TR/xlink/" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:dim="http://www.dspace.org/xmlns/dspace/dim" xmlns:xhtml="http://www.w3.org/1999/xhtml" xmlns:mods="http://www.loc.gov/mods/v3" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns="http://www.w3.org/1999/xhtml" exclude-result-prefixes="i18n dri mets xlink xsl dim xhtml mods dc">
   <xsl:output indent="yes"/>
   <!-- The template to handle dri:options. Since it contains only dri:list tags (which carry the actual -->
   <!-- information), the only things than need to be done is creating the ds-options div and applying -->
   <!-- the templates inside it. -->
   <!-- In fact, the only bit of real work this template does is add the search box, which has to be -->
   <!-- handled specially in that it is not actually included in the options div, and is instead built -->
   <!-- from metadata available under pageMeta. -->
   <!-- TODO: figure out why i18n tags break the go button -->
   <xsl:template match="dri:options">
      <div id="ds-options" class="word-break hidden-print">
           <!-- <xsl:if test="'' = $request-uri">
               <a class="list-group-item" title="Universidad Nacional del Nordeste" target="_blank" href="https://www.unne.edu.ar/plandecontingencia/">
                        <img class="img-responsive center-block" alt="Universidad Nacional del Nordeste" src="{concat($theme-path, 'images/feed/plan_.jpg')}"/>
               </a>
               <a class="list-group-item" title="Universidad Nacional del Nordeste" target="_blank" href="https://acortar.link/LWpgE/">
                        <img class="img-responsive center-block" alt="COVID-19 SNRD" src="{concat($theme-path, 'images/feed/covid.jpg')}"/>
               </a>
            </xsl:if>  
            -->       
                           
            <!-- Boton para subir los trabajos -->       
                  <div class="list-group">
                     <a class="list-group-item">
                        <xsl:attribute name="href">
                           <xsl:value-of select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='contextPath'][not(@qualifier)]"/>
                           <xsl:text>/submit</xsl:text>
                        </xsl:attribute>
                        <div class="row">
                           <div class="col-md-12 hcenter">                           
                              <span aria-hidden="true" class="glyphicon glyphicon-log-in gi-4x"></span>
                              
                              <div>
                                 <br></br>
                                 <b>
                                    <i18n:text>xmlui.encabezado.subir</i18n:text>
                                 </b>
                                 
                              </div>
                           </div>
                        </div>
                        <!-- 
                        <div class="row hidden-xs">
                           <div class="col-md-12">
                            
                              <i18n:text>xmlui.boton.subir</i18n:text>
                           </div>
                        </div>-->
                     </a>
                  </div>

         <xsl:if test="'' != $request-uri">
            <div id="ds-search-option" class="ds-option-set">             
               <form id="ds-search-form" class="" method="post">
                  <xsl:attribute name="action">
                     <xsl:value-of select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='contextPath']"/>
                     <xsl:value-of select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='search'][@qualifier='simpleURL']"/>
                  </xsl:attribute>
                  <fieldset>
                     <div class="input-group">
                        <input class="ds-text-field form-control" type="text" placeholder="xmlui.general.search" i18n:attr="placeholder">
                           <xsl:attribute name="name">
                              <xsl:value-of select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='search'][@qualifier='queryField']"/>
                           </xsl:attribute>
                        </input>
                        <span class="input-group-btn">
                           <button class="ds-button-field btn btn-primary" title="xmlui.general.go" i18n:attr="title">
                              <span class="glyphicon glyphicon-search" aria-hidden="true"/>
                              <xsl:attribute name="onclick">
                                 <xsl:text>var radio = document.getElementById(&quot;ds-search-form-scope-container&quot;); if (radio != undefined &amp;&amp; radio.checked) { var form = document.getElementById(&quot;ds-search-form&quot;); form.action=</xsl:text>
                                 <xsl:text>&quot;</xsl:text>
                                 <xsl:value-of select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='contextPath']"/>
                                 <xsl:text>/handle/&quot; + radio.value + &quot;</xsl:text>
                                 <xsl:value-of select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='search'][@qualifier='simpleURL']"/>
                                 <xsl:text>&quot; ;</xsl:text>
                                 <xsl:text>}</xsl:text>
                              </xsl:attribute>
                           </button>
                        </span>
                     </div>
                     <xsl:if test="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='focus'][@qualifier='container']">
                        <div class="radio">
                           <label>
                              <input id="ds-search-form-scope-all" type="radio" name="scope" value="" checked="checked"/>
                              <i18n:text>xmlui.dri2xhtml.structural.search</i18n:text>
                           </label>
                        </div>
                        <div class="radio">
                           <label>
                              <input id="ds-search-form-scope-container" type="radio" name="scope">
                                 <xsl:attribute name="value">
                                    <xsl:value-of select="substring-after(/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='focus'][@qualifier='container'],':')"/>
                                 </xsl:attribute>
                              </input>
                              <xsl:choose>
                                 <xsl:when test="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='focus'][@qualifier='containerType']/text() = 'type:community'">
                                    <i18n:text>xmlui.dri2xhtml.structural.search-in-community</i18n:text>
                                 </xsl:when>
                                 <xsl:otherwise>
                                    <i18n:text>xmlui.dri2xhtml.structural.search-in-collection</i18n:text>
                                 </xsl:otherwise>
                              </xsl:choose>
                           </label>
                        </div>
                     </xsl:if>
                  </fieldset>
               </form>             
            </div>
         </xsl:if>       
        
         <xsl:apply-templates/>
         <!-- DS-984 Add RSS Links to Options Box 
         <xsl:if test="count(/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='feed']) != 0">
            <div>
               <h2 class="ds-option-set-head h6">
                  <i18n:text>xmlui.feed.header</i18n:text>
               </h2>
               <div id="ds-feed-option" class="ds-option-set list-group">
                  <xsl:call-template name="addRSSLinks"/>
               </div>
            </div>
         </xsl:if>
         -->

         <!-- Links de interes -->
         <div>
            <h2 class="ds-option-set-head h6">Links de interés</h2>
            <div id="ds-feed-option" class="ds-option-set list-group">
             
               <a class="list-group-item" title="Biblioteca Electrónica de Ciencia y Tecnología" target="_blank" href="http://bib.unne.edu.ar">
                  <img class="img-responsive center-block" alt="Biblioteca Electrónica de Ciencia y Tecnología" src="{concat($theme-path, 'images/feed/becyt.png')}"/>
               </a>

               <a class="list-group-item" title="Sistema Nacional de Repositorios Digitales" target="_blank" href="http://redbiblio.unne.edu.ar/opac/cgi-bin/pgopac.cgi?form=Default">
                  <img class="img-responsive center-block" alt="Sistema Nacional de Repositorios Digitales" src="{concat($theme-path, 'images/feed/snrd.png')}"/>                  
               </a> 
                        
                <a class="list-group-item" title="Dacytar" target="_blank" href="https://dacytar.mincyt.gob.ar/">
                  <img class="img-responsive center-block" alt="Dacytar" src="{concat($theme-path, 'images/feed/dacytar.png')}"/>
               </a>
               
               <a class="list-group-item" title="Portal de Revistas UNNE" target="_blank" href="http://revistas.unne.edu.ar/">
                  <img class="img-responsive center-block" alt="Portal de Revistas UNNE" src="{concat($theme-path, 'images/feed/revistas.png')}"/>
               </a>       

             


                      
    
              
               <!-- 
                    <a class="list-group-item" title="Universidad Nacional del Nordeste" target="_blank" href="http://www.unne.edu.ar">
                  <img class="img-responsive center-block" alt="Universidad Nacional del Nordeste" src="{concat($theme-path, 'images/feed/unne_logo.png')}"/>
               </a> 

               <a class="list-group-item" title="Rediab" target="_blank" href="http://rediab.cin.edu.ar/">
                  <img class="img-responsive center-block" alt="Rediab" src="{concat($theme-path, 'images/feed/rediab.jpg')}"/>
               </a>
                <a class="list-group-item" title="SIU" target="_blank" href="https://www.siu.edu.ar/">
                  <img class="img-responsive center-block" alt="SIU" src="{concat($theme-path, 'images/feed/siu.png')}"/>
               </a>    
                <a class="list-group-item">
                  <img class="img-responsive center-block" alt="emiliano" src="{concat($theme-path, 'images/feed/emiliano.png')}"/>
               </a>               
                <a class="list-group-item" title="Biblioteca Electrónica de Ciencia y Tecnología" target="_blank" href="https://www.biblioteca.mincyt.gob.ar/">
                  <img class="img-responsive center-block" alt="BECYT" src="{concat($theme-path, 'images/feed/becyt.jpg')}"/>
               </a> 
               -->

               </div>
         </div>
      </div>
   </xsl:template>
   <!-- Add each RSS feed from meta to a list -->
   <xsl:template name="addRSSLinks">
      <xsl:for-each select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='feed']">
         <a class="list-group-item">
            <xsl:attribute name="href">
               <xsl:value-of select="."/>
            </xsl:attribute>
            <img src="{concat($context-path, '/static/icons/feed.png')}" class="btn-xs" alt="xmlui.mirage2.navigation.rss.feed" i18n:attr="alt"/>
            <xsl:choose>
               <xsl:when test="contains(., 'rss_1.0')">
                  <xsl:text>RSS 1.0</xsl:text>
               </xsl:when>
               <xsl:when test="contains(., 'rss_2.0')">
                  <xsl:text>RSS 2.0</xsl:text>
               </xsl:when>
               <xsl:when test="contains(., 'atom_1.0')">
                  <xsl:text>Atom</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:value-of select="@qualifier"/>
               </xsl:otherwise>
            </xsl:choose>
         </a>
      </xsl:for-each>
   </xsl:template>

    <xsl:template match="dri:options/dri:list" priority="3">
      <xsl:apply-templates select="dri:head"/>
      <div>
         <xsl:call-template name="standardAttributes">
            <xsl:with-param name="class">list-group</xsl:with-param>
         </xsl:call-template>
         <xsl:apply-templates select="dri:item"/>
         <xsl:apply-templates select="dri:list"/>
      </div>
   </xsl:template>

   <xsl:template match="dri:options//dri:list">
      <xsl:apply-templates select="dri:head"/>
      <xsl:apply-templates select="dri:item"/>
      <xsl:apply-templates select="dri:list"/>
   </xsl:template>
  
   
   <xsl:template match="dri:options//dri:item[dri:xref]">
      <a href="{dri:xref/@target}">
         <xsl:call-template name="standardAttributes">
            <xsl:with-param name="class">list-group-item ds-option</xsl:with-param>
         </xsl:call-template>
         <xsl:choose>
            <xsl:when test="dri:xref/node()">
               <xsl:apply-templates select="dri:xref/node()"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:value-of select="dri:xref"/>
            </xsl:otherwise>
         </xsl:choose>
      </a>
   </xsl:template>

   <xsl:template match="dri:options//dri:item">
      <div>
         <xsl:call-template name="standardAttributes">
            <xsl:with-param name="class">list-group-item ds-option</xsl:with-param>
         </xsl:call-template>
         <xsl:apply-templates />
      </div>
   </xsl:template>
   <xsl:template match="dri:options/dri:list/dri:head" priority="3">
      <xsl:call-template name="renderHead">
         <xsl:with-param name="class">ds-option-set-head</xsl:with-param>
      </xsl:call-template>
   </xsl:template>
   <xsl:template match="dri:options/dri:list//dri:list/dri:head" priority="3">
      <a class="list-group-item active">
         <span>
            <xsl:call-template name="standardAttributes">
               <xsl:with-param name="class">
                  <xsl:value-of select="@rend"/>
                  <xsl:text>list-group-item-heading</xsl:text>
               </xsl:with-param>
            </xsl:call-template>
            <xsl:apply-templates/>
         </span>
      </a>
   </xsl:template>
   <xsl:template match="dri:list[count(child::*)=0]"/>
</xsl:stylesheet>
