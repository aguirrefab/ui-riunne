<xsl:stylesheet xmlns:i18n="http://apache.org/cocoon/i18n/2.1" xmlns:dri="http://di.tamu.edu/DRI/1.0/" xmlns:mets="http://www.loc.gov/METS/" xmlns:xlink="http://www.w3.org/TR/xlink/" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:dim="http://www.dspace.org/xmlns/dspace/dim" xmlns:xhtml="http://www.w3.org/1999/xhtml" xmlns:mods="http://www.loc.gov/mods/v3" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:confman="org.dspace.core.ConfigurationManager" exclude-result-prefixes="i18n dri mets xlink xsl dim xhtml mods dc confman">
   <xsl:output method="xml" encoding="UTF-8" indent="yes"/>
   <!-- Requested Page URI. Some functions may alter behavior of processing depending if URI matches a pattern. -->
   <!-- Specifically, adding a static page will need to override the DRI, to directly add content. -->
   <xsl:variable name="request-uri" select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='request'][@qualifier='URI']"/>

   <xsl:template match="dri:document">
      <xsl:choose>
         <xsl:when test="not($isModal)">
            <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
            <xsl:text disable-output-escaping="yes">&lt;!--[if lt IE 7]&gt; &lt;html class=&quot;no-js lt-ie9 lt-ie8 lt-ie7&quot; lang=&quot;en&quot;&gt; &lt;![endif]--&gt; &lt;!--[if IE 7]&gt; &lt;html class=&quot;no-js lt-ie9 lt-ie8&quot; lang=&quot;en&quot;&gt; &lt;![endif]--&gt; &lt;!--[if IE 8]&gt; &lt;html class=&quot;no-js lt-ie9&quot; lang=&quot;en&quot;&gt; &lt;![endif]--&gt; &lt;!--[if gt IE 8]&gt;&lt;!--&gt; &lt;html class=&quot;no-js&quot; lang=&quot;en&quot;&gt; &lt;!--&lt;![endif]--&gt;</xsl:text>
            <!-- First of all, build the HTML head element -->
            <xsl:call-template name="buildHead"/>

            <!-- Then proceed to the body -->
            <body>                           
               <xsl:choose>
                  <xsl:when test="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='framing'][@qualifier='popup']">
                     <xsl:apply-templates select="dri:body/*"/>
                  </xsl:when>
                  <xsl:otherwise>
                                 <xsl:call-template name="buildHeader"/>
                                    <xsl:call-template name="buildTrail"/>
                                       <!-- javascript-disabled warning, will be invisible if javascript is enabled -->
                                          <div id="no-j." class="hidden">
                                             <div id="no-js-warning">
                                                <div class="notice failure">
                                                   <xsl:text>JavaScript is disabled for your browser. Some features of this site may not work without it.</xsl:text>
                                                </div>
                                             </div>
                                          </div>                                                                                          
                                       
                                          <div id="main-container" class="container-fluid">
                                             <div class="row row-offcanvas row-offcanvas-right">
                                                <div class="horizontal-slider clearfix">
                                                   <div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar" role="navigation">
                                                      <xsl:apply-templates select="dri:options"/>
                                                   </div>                                                                                                                           
                                                      <div class="col-md-9 main-content content-riunne"><!-- Comunidades Thumb --> 
                                                         <xsl:if test="'' = $request-uri"><!-- If page/home - show component -->    
                                                            <!--<div id="news" class="container-fluid"> Carousel RIUNNE -->                                                                                                                      
                                                               <div id="carousel1" class="carousel slide hidden-xs" data-ride="carousel"><!-- Carousel RIUNNE -->                                                        
                                                                  <div class="carousel-inner" role="listbox">                                                           
                                                                     <div class="item active">
                                                                        <a class="slide" href="https://www.researchgate.net/profile/Liliana-Ramirez-4" target="_blank">
                                                                        <img src="{$theme-path}images/home/slide/ref_riunne_liliana-ramirez.png" alt="Autor: Liliana Ramirez"/>
                                                                        </a>                                                                                                                                                                                                                                                                    
                                                                     </div>                                                                 
                                                                     <div class="item">
                                                                        <a class="slide" href="https://orcid.org/0000-0001-8562-2105" target="_blank">
                                                                        <img src="{$theme-path}images/home/slide/ref_riunne_dante-cuadra.png" alt="Autor: Dante Cuadra"/>  
                                                                        </a>                                                                                                                                                                                                                                                                       
                                                                     </div>
                                                                     <div class="item">
                                                                        <a class="slide" href="https://orcid.org/0000-0003-4696-4158" target="_blank">
                                                                        <img src="{$theme-path}images/home/slide/ref_riunne_gustavo-giusiano.png" alt="Autor: Gustavo Giusiano"/>
                                                                        </a>                                                                                                                                                                                          
                                                                     </div>    
                                                                     <div class="item">
                                                                        <a class="slide" href="https://revistas.unne.edu.ar/" target="_blank">
                                                                        <img src="{$theme-path}images/home/slide/portal.png" alt="Portal de Revistas UNNE"/>
                                                                        </a>                                                                   
                                                                     </div>  
                                                                                                                           
                                                                  </div>
                                                                     <a class="left carousel-control" href="#carousel1" role="button" data-slide="prev">
                                                                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                                                        <span class="sr-only">Anterior</span>
                                                                     </a>
                                                                     <a class="right carousel-control" href="#carousel1" role="button" data-slide="next">
                                                                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                                                        <span class="sr-only">Siguiente</span>
                                                                     </a>                                                                                                                         
                                                               </div>             
                                                                                                                                                                       
                                                            <div class="col-md-12" id="comunities">                                                                                                                                                                 
                                                                     <div class="comunidad-view hidden-xs">                                                                
                                                                     
                                                                              <a href="handle/123456789/31">                           
                                                                                 <img class="card-img-top" alt="Facultad de Arquitectura y Urbanismo" src="{concat($theme-path, 'images/comunidades/00.png')}"/>                 
                                                                                 <p>Arquitectura y Urbanismo</p>
                                                                              </a>  
                                                                               
                                                                               <a href="handle/123456789/41">                           
                                                                                 <img class="card-img-top" alt="Facultad de Artes, Diseño y Ciencias de la Cultura" src="{concat($theme-path, 'images/comunidades/01.png')}"/>                 
                                                                                 <p>Artes, Diseño y Ciencias de la Cultura</p>
                                                                              </a>  
                                                                               <a href="handle/123456789/51">                           
                                                                                 <img class="card-img-top" alt="Facultad de Ciencias Agrarias" src="{concat($theme-path, 'images/comunidades/02.png')}"/>                 
                                                                                 <p>Ciencias Agrarias</p>
                                                                              </a>  
                                                                               <a href="handle/123456789/61">                           
                                                                                 <img class="card-img-top" alt="Facultad de Ciencias Económicas" src="{concat($theme-path, 'images/comunidades/03.png')}"/>                 
                                                                                 <p>Ciencias Económicas</p>
                                                                              </a>  
                                                                                <a href="handle/123456789/71">                           
                                                                                 <img class="card-img-top" alt="Facultad de Ciencias Exactas y Naturales y Agrimensura" src="{concat($theme-path, 'images/comunidades/04.png')}"/>                 
                                                                                 <p>Ciencias Exactas y Naturales y Agrimensura</p>
                                                                              </a>  
                                                                                <a href="handle/123456789/81">                           
                                                                                 <img class="card-img-top" alt="Facultad de Ciencias Veterinarias" src="{concat($theme-path, 'images/comunidades/05.png')}"/>                 
                                                                                 <p>Ciencias Veterinarias</p>
                                                                              </a>  
                                                                                <a href="handle/123456789/91">                           
                                                                                 <img class="card-img-top" alt="Facultad de Derecho y Ciencias Sociales y Políticas" src="{concat($theme-path, 'images/comunidades/06.png')}"/>                 
                                                                                 <p>Derecho y Ciencias Sociales y Políticas</p>
                                                                              </a>  
                                                                              <a href="handle/123456789/101">                           
                                                                                 <img class="card-img-top" alt="Facultad de Humanidades" src="{concat($theme-path, 'images/comunidades/07.png')}"/>                 
                                                                                 <p>Humanidades</p>
                                                                              </a> 
                                                                              <a href="handle/123456789/111">                           
                                                                                 <img class="card-img-top" alt="Facultad de Ingeniería" src="{concat($theme-path, 'images/comunidades/08.png')}"/>                 
                                                                                 <p>Ingeniería</p>
                                                                              </a> 
                                                                               <a href="handle/123456789/121">                           
                                                                                 <img class="card-img-top" alt="Facultad de Medicina" src="{concat($theme-path, 'images/comunidades/09.png')}"/>                 
                                                                                 <p>Medicina</p>
                                                                              </a>                                                                                
                                                                               <a href="handle/123456789/131">                           
                                                                                 <img class="card-img-top" alt="Facultad de Odontología" src="{concat($theme-path, 'images/comunidades/10.png')}"/>                 
                                                                                 <p>Odontología</p>
                                                                              </a> 
                                                                               <a href="handle/123456789/141">                           
                                                                                 <img class="card-img-top" alt="Facultad de Ciencias Criminalísticas y Criminología" src="{concat($theme-path, 'images/comunidades/11.png')}"/>                 
                                                                                 <p>Ciencias Criminalísticas y Criminología</p>
                                                                              </a>
                                                                              <a href="handle/123456789/27504">                           
                                                                                 <img class="card-img-top" alt="Facultad de Medicina Regional" src="{concat($theme-path, 'images/comunidades/12.png')}"/>                 
                                                                                 <p>Medicina Regional</p>
                                                                              </a>
                                                                              <a href="handle/123456789/1">                           
                                                                                 <img class="card-img-top" alt="Repositorio Institucional UNNE" src="{concat($theme-path, 'images/comunidades/13.png')}"/>                 
                                                                                 <p>Repositorio Institucional</p>
                                                                              </a>
                                                                              <a href="handle/123456789/25">                           
                                                                                 <img class="card-img-top" alt="CONICET / UNNE" src="{concat($theme-path, 'images/comunidades/14.png')}"/>                 
                                                                                 <p>CONICET Nordeste</p>
                                                                              </a>
                                                                               <a href="handle/123456789/15">                           
                                                                                 <img class="card-img-top" alt="Autoarchivo RIUNNE" src="{concat($theme-path, 'images/comunidades/15.png')}"/>                 
                                                                                 <p>Autoarchivo RIUNNE</p>
                                                                              </a>   
                                                                                <a href="handle/123456789/28471">                           
                                                                                 <img class="card-img-top" alt="Archivo Institucional UNNE" src="{concat($theme-path, 'images/comunidades/16.png')}"/>                 
                                                                                 <p>Archivo Institucional UNNE</p>
                                                                              </a>                                                                                                       
                                                                        </div>   
                                                               <div class="text_head">                
                                                                  <h3></h3>                                                                                         
                                                               </div>  
                                                            </div> 
                                                         </xsl:if>                                                        
                                                            <!-- Comunidades en lista y envios recientes-->
                                                            <xsl:apply-templates select="*[not(self::dri:options)]"/>
                                                            <div class="visible-xs visible-sm">
                                                               <xsl:call-template name="buildFooter"/>
                                                            </div>    
                                                         
                                                      </div>                                                                                                                                                                                                                                                                                                                                                           
                                                </div>                                           
                                             </div>                                                
                                          </div>                                                                                                                     
                  </xsl:otherwise>
               </xsl:choose>
               <!-- Javascript at the bottom for fast page loading -->
               <xsl:call-template name="addJavascript"/>
               <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
               
            </body>
                  <!-- The footer div, dropping whatever extra information is needed on the page. It will -->
                  <!-- most likely be something similar in structure to the currently given example. -->
                                    <div class="hidden-xs hidden-sm">
                                        <xsl:call-template name="buildFooter"/>
                                    </div>
                                    <footer>
                                        <div class="container-fluid">
                                           <div class="row">
                                              <div class="col-md-12 hidden-xs">
                                                 <i18n:text>xmlui.footer.texto1</i18n:text>
                                              </div>
                                           </div>
                                           <div class="row">
                                              <div class="col-md-3 col-xs-4">
                                                 <a title="BDU2" target="_blank" href="http://cosechador.siu.edu.ar/bdu3">
                                                    <img class="img-responsive center-block" alt="BDU2" src="{concat($theme-path, 'images/footer/bdu2.png')}"/>
                                                 </a>
                                              </div>
                                              <div class="col-md-3 col-xs-4">
                                                 <a title="Sistema Nacional de Repositorios Nacionales" target="_blank" href="http://repositorios.mincyt.gob.ar">
                                                    <img class="img-responsive center-block" alt="Sistema Nacional de Repositorios Nacionales" src="{concat($theme-path, 'images/footer/SNRD.png')}"/>
                                                 </a>
                                              </div>
                                              <div class="col-md-3 col-xs-4">
                                                 <a title="BASE" target="_blank" href="https://www.base-search.net/">
                                                    <img class="img-responsive center-block" alt="BASE - Bielefeld Academic Search Engine" src="{concat($theme-path, 'images/footer/base_logo.gif')}"/>
                                                 </a>
                                              </div>
                                              <div class="col-md-3 hidden-print hidden-sm hidden-xs">
                                                 <span class="theme-by">Theme by&#160;</span>
                                                 <br/>
                                                 <a title="Atmire NV" target="_blank" href="http://atmire.com">
                                                    <img class="img-responsive center-block" alt="Atmire NV" src="{concat($theme-path, 'images/footer/@mirelogo-new.svg')}"/>
                                                 </a>
                                              </div>
                                           </div>
                                           <div class="row">
                                              <div class="col-md-4 hidden-print">
                                                 <a>
                                                    <xsl:attribute name="href">
                                                       <xsl:value-of select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='contextPath'][not(@qualifier)]"/>
                                                       <xsl:text>/contact</xsl:text>
                                                    </xsl:attribute>
                                                    <i18n:text>xmlui.dri2xhtml.structural.contact-link</i18n:text>
                                                 </a>
                                                 <xsl:text>|</xsl:text>
                                                 <a>
                                                    <xsl:attribute name="href">
                                                       <xsl:value-of select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='contextPath'][not(@qualifier)]"/>
                                                       <xsl:text>/feedback</xsl:text>
                                                    </xsl:attribute>
                                                    <i18n:text>xmlui.dri2xhtml.structural.feedback-link</i18n:text>
                                                 </a>
                                              </div>
                                              <div class="col-md-8 hidden-print hidden-sm hidden-xs">
                                                 <div style="text-align:right; padding-right:40px;">
                                                    <i18n:text>xmlui.footer.texto2</i18n:text>
                                                    <a href="http://www.dspace.org/" target="_blank">DSpace software</a>copyright&#160;&#169;&#160;2002 -
                                                    <script language="JavaScript" type="text/javascript">var now = new Date(); var year= now.getFullYear(); document.write(year);</script>|
                                                    <a href="http://www.duraspace.org/" target="_blank">
                                                       <i18n:text>xmlui.footer.texto3</i18n:text>
                                                    </a>
                                                 </div>
                                              </div>
                                              <!-- Invisible link to HTML sitemap (for search engines) -->
                                              <a class="hidden">
                                                 <xsl:attribute name="href">
                                                    <xsl:value-of select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='contextPath'][not(@qualifier)]"/>
                                                    <xsl:text>/htmlmap</xsl:text>
                                                 </xsl:attribute>
                                                 <xsl:text>&#160;</xsl:text>
                                              </a>
                                          </div>
                                        </div>
                                    </footer>                     
            <xsl:text disable-output-escaping="yes">&lt;/html&gt;</xsl:text>
         </xsl:when>
         <xsl:otherwise>
            <!-- This is only a starting point. If you want to use this feature you need to implement -->
            <!-- JavaScript code and a XSLT template by yourself. Currently this is used for the DSpace Value Lookup -->
            <xsl:apply-templates select="dri:body" mode="modal"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <!-- The HTML head element contains references to CSS as well as embedded JavaScript code. Most of this -->
   <!-- information is either user-provided bits of post-processing (as in the case of the JavaScript), or -->
   <!-- references to stylesheets pulled directly from the pageMeta element. -->
   <xsl:template name="buildHead">
      <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
         <!-- Use the .htaccess and remove these lines to avoid edge case issues. -->
         <!-- More info: h5bp.com/i/378 -->
         <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
         <!-- Mobile viewport optimized: h5bp.com/viewport -->
         <meta name="viewport" content="width=device-width,initial-scale=1"/>
         <link rel="shortcut icon">
            <xsl:attribute name="href">
               <xsl:value-of select="$theme-path"/>
               <xsl:text>images/brand/favicon_riunne.png</xsl:text>
            </xsl:attribute>
         </link>
         <link rel="apple-touch-icon">
            <xsl:attribute name="href">
               <xsl:value-of select="$theme-path"/>
               <xsl:text>images/apple-touch-icon.png</xsl:text>
            </xsl:attribute>
         </link>
         <meta name="Generator">
            <xsl:attribute name="content">
               <xsl:text>DSpace</xsl:text>
               <xsl:if test="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='dspace'][@qualifier='version']">
                  <xsl:text></xsl:text>
                  <xsl:value-of select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='dspace'][@qualifier='version']"/>
               </xsl:if>
            </xsl:attribute>
         </meta>
         <!-- Add stylesheets -->
         <!-- TODO figure out a way to include these in the concat & minify -->
         <xsl:for-each select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='stylesheet']">
            <link rel="stylesheet" type="text/css">
               <xsl:attribute name="media">
                  <xsl:value-of select="@qualifier"/>
               </xsl:attribute>
               <xsl:attribute name="href">
                  <xsl:value-of select="$theme-path"/>
                  <xsl:value-of select="."/>
               </xsl:attribute>
            </link>
         </xsl:for-each>
         <link rel="stylesheet" href="{concat($theme-path, 'styles/main.css')}"/>
         <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.2/font/bootstrap-icons.css"/>
         <!-- Add syndication feeds -->
         <xsl:for-each select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='feed']">
            <link rel="alternate" type="application">
               <xsl:attribute name="type">
                  <xsl:text>application/</xsl:text>
                  <xsl:value-of select="@qualifier"/>
               </xsl:attribute>
               <xsl:attribute name="href">
                  <xsl:value-of select="."/>
               </xsl:attribute>
            </link>
         </xsl:for-each>
         <!-- Add OpenSearch auto-discovery link -->
         <xsl:if test="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='opensearch'][@qualifier='shortName']">
            <link rel="search" type="application/opensearchdescription+xml">
               <xsl:attribute name="href">
                  <xsl:value-of select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='request'][@qualifier='scheme']"/>
                  <xsl:text>://</xsl:text>
                  <xsl:value-of select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='request'][@qualifier='serverName']"/>
                  <xsl:text>:</xsl:text>
                  <xsl:value-of select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='request'][@qualifier='serverPort']"/>
                  <xsl:value-of select="$context-path"/>
                  <xsl:text>/</xsl:text>
                  <xsl:value-of select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='opensearch'][@qualifier='autolink']"/>
               </xsl:attribute>
               <xsl:attribute name="title" >
                  <xsl:value-of select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='opensearch'][@qualifier='shortName']"/>
               </xsl:attribute>
            </link>
         </xsl:if>
         <!-- The following javascript removes the default text of empty text areas when they are focused on or submitted -->
         <!-- There is also javascript to disable submitting a form when the 'enter' key is pressed. -->
         <script>
            //Clear default text of emty text areas on focus
            function tFocus(element) {
               if (element.value == '<i18n:text>xmlui.dri2xhtml.default.textarea.value</i18n:text>') {
                  element.value='';
               }
            }
            //Clear default text of emty text areas on submit
            function tSubmit(form) {
               var defaultedElements = document.getElementsByTagName("textarea");
               for (var i=0; i != defaultedElements.length; i++) {
                  if (defaultedElements[i].value == '<i18n:text>xmlui.dri2xhtml.default.textarea.value</i18n:text>') {
                     defaultedElements[i].value='';
                  }
               }
            }
            //Disable pressing 'enter' key to submit a form (otherwise pressing 'enter' causes a submission to start over)
            function disableEnterKey(e) {
               var key;
               if(window.event)
                  key = window.event.keyCode;
               //Internet Explorer
               else
                  key = e.which;
               //Firefox and Netscape
               if(key == 13)
               //if "Enter" pressed, then disable!
                  return false;
               else
                  return true;
            }
         </script>
         <xsl:text disable-output-escaping="yes">&lt;!--[if lt IE 9]&gt; &lt;script src="</xsl:text>
         <xsl:value-of select="concat($theme-path, 'vendor/html5shiv/dist/html5shiv.js')"/>
         <xsl:text disable-output-escaping="yes">"&gt;&#160;&lt;/script&gt; &lt;script src="</xsl:text>
         <xsl:value-of select="concat($theme-path, 'vendor/respond/dest/respond.min.js')"/>
         <xsl:text disable-output-escaping="yes">"&gt;&#160;&lt;/script&gt; &lt;![endif]--&gt;</xsl:text>
         <!-- Modernizr enables HTML5 elements & feature detects -->
         <script src="{concat($theme-path, 'vendor/modernizr/modernizr.js')}">&#160;</script>
         <!-- Add the title in -->
         <xsl:variable name="page_title" select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='title'][last()]" />
         <title>
            <xsl:choose>
               <xsl:when test="starts-with($request-uri, 'page/about')">
                  <i18n:text>xmlui.mirage2.page-structure.about.title</i18n:text>
               </xsl:when>
               <xsl:when test="starts-with($request-uri, 'page/dspace')">
                  <i18n:text>xmlui.mirage2.page-structure.dspace.title</i18n:text>
               </xsl:when>
                 <xsl:when test="starts-with($request-uri, 'page/revistas')">
                  <i18n:text>xmlui.mirage2.page-structure.revistas.title</i18n:text>
               </xsl:when>
               <xsl:when test="starts-with($request-uri, 'page/openaccess')">
                  <i18n:text>xmlui.mirage2.page-structure.openaccess.title</i18n:text>
               </xsl:when>
               <xsl:when test="starts-with($request-uri, 'page/use')">
                  <i18n:text>xmlui.mirage2.page-structure.use.title</i18n:text>
               </xsl:when>
               <xsl:when test="starts-with($request-uri, 'page/propiedadintelectual')">
                  <i18n:text>xmlui.mirage2.page-structure.propiedadintelectual.title</i18n:text>
               </xsl:when>
               <xsl:when test="starts-with($request-uri, 'page/faq')">
                  <i18n:text>xmlui.mirage2.page-structure.faq.title</i18n:text>
               </xsl:when>
               <xsl:when test="starts-with($request-uri, 'page/novedades')">
                  <i18n:text>xmlui.mirage2.page-structure.novedades.title</i18n:text>
               </xsl:when>
               <xsl:when test="not($page_title)">
                  <xsl:text></xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:copy-of select="$page_title/node()" />
               </xsl:otherwise>
            </xsl:choose>
         </title>
         <!-- Head metadata in item pages -->
         <xsl:if test="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='xhtml_head_item']">
            <xsl:value-of select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='xhtml_head_item']" disable-output-escaping="yes"/>
         </xsl:if>
         <!-- Add all Google Scholar Metadata values -->
         <xsl:for-each select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[substring(@element, 1, 9) = 'citation_']">
            <meta name="{@element}" content="{.}"></meta>
         </xsl:for-each>
         <!-- Add MathJAX JS library to render scientific formulas -->
         <xsl:if test="confman:getProperty('webui.browse.render-scientific-formulas') = 'true'">
            <script type="text/x-mathjax-config">MathJax.Hub.Config({ tex2jax: { inlineMath: [['$','$'], ['\\(','\\)']], ignoreClass: "detail-field-data|detailtable|exception" }, TeX: { Macros: { AA: '{\\mathring A}' } } });</script>
            <script type="text/javascript" src="//cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML">&#160;</script>
         </xsl:if>         
      </head>
   </xsl:template>
   <!-- The header (distinct from the HTML head element) contains the title, subtitle, login box and various -->
   <!-- placeholders for header images -->
    <xsl:template name="buildHeader">
      <header>
         <!-- <div id="main-menu" class="navbar navbar-default navbar-fixed-top" role="navigation"> -->
         <div id="main-menu" class="navbar navbar-light bg-light" role="navigation">            
            <div class="container-riunne">                  
                  <a class="navbar-brand" href="{$context-path}/">
                     <img src="{$theme-path}images/brand/logo_riunne.png"/>
                  </a>  
                  <form class="form-inline hidden-xs" method="get" action="/xmlui/discover">
                        <div class="input-group input-group-md">
                           <input type="text" class="form-control" maxlength="200" size="50" placeholder="Encontrá tesis, artículos, informes, etc..." name="query" title="Buscar en RIUNNE">
                           </input>
                           <div class="input-group-btn">
                              <button type="submit" class="btn btn-reverse">
                                 <span class="glyphicon glyphicon-search"></span>                           
                              </button>
                           </div>                 
                        </div>
                  </form>    
                                           
                  <button type="button" class="navbar-toggle menu-button" data-toggle="offcanvas">
                     <span class="sr-only">
                        <i18n:text>xmlui.mirage2.page-structure.toggleNavigation</i18n:text>
                     </span>
                     <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                  </button>
                  
                  <div class="navbar-header visible-xs hidden-sm hidden-md hidden-lg">                                                                                 
                     <ul class="nav navbar-nav">         
                        <!--<xsl:if test="count(/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='page'][@qualifier='supportedLocale']) &gt; 1">
                           <li id="ds-language-selection" class="dropdown">
                              <xsl:variable name="active-locale" select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='page'][@qualifier='currentLocale']"/>
                              <button id="language-dropdown-toggle-xs" href="#" role="button" class="dropdown-toggle navbar-toggle navbar-link" data-toggle="dropdown">
                                 <b class="glyphicon glyphicon-globe" aria-hidden="true"/>
                              </button>
                              <ul class="dropdown-menu pull-right" role="menu" aria-labelledby="language-dropdown-toggle-xs" data-no-collapse="true">
                                 <xsl:for-each select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='page'][@qualifier='supportedLocale']">
                                    <xsl:variable name="locale" select="."/>
                                    <li role="presentation">
                                       <xsl:if test="$locale = $active-locale">
                                          <xsl:attribute name="class">
                                             <xsl:text>disabled</xsl:text>
                                          </xsl:attribute>
                                       </xsl:if>
                                       <a class="text-decoration-a">
                                          <xsl:attribute name="href">
                                             <xsl:value-of select="$current-uri"/>
                                             <xsl:text>?locale-attribute=</xsl:text>
                                             <xsl:value-of select="$locale"/>
                                          </xsl:attribute>
                                          <xsl:value-of select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='supportedLocale'][@qualifier=$locale]"/>
                                       </a>
                                    </li>
                                 </xsl:for-each>
                              </ul>
                           </li> 
                        </xsl:if>-->
                        <xsl:choose>
                           <xsl:when test="/dri:document/dri:meta/dri:userMeta/@authenticated = 'yes'">
                              <li class="dropdown">
                                 <button class="dropdown-toggle navbar-toggle navbar-link" id="user-dropdown-toggle-xs" href="#" role="button" data-toggle="dropdown">
                                    <b class="visible-xs glyphicon glyphicon-user" aria-hidden="true"/>
                                 </button>
                                 <ul class="dropdown-menu pull-right" role="menu" aria-labelledby="user-dropdown-toggle-xs" data-no-collapse="true">
                                    <li>
                                       <a href="{/dri:document/dri:meta/dri:userMeta/ dri:metadata[@element='identifier' and @qualifier='url']}" class="text-decoration-a">
                                          <i18n:text>xmlui.EPerson.Navigation.profile</i18n:text>
                                       </a>
                                    </li>
                                    <li>
                                       <a href="{/dri:document/dri:meta/dri:userMeta/ dri:metadata[@element='identifier' and @qualifier='logoutURL']}" class="text-decoration-a">
                                          <i18n:text>xmlui.dri2xhtml.structural.logout</i18n:text>
                                       </a>
                                    </li>
                                 </ul>
                              </li>
                           </xsl:when>
                           <xsl:otherwise>
                              <li>
                                 <form style="display: inline" action="{/dri:document/dri:meta/dri:userMeta/dri:metadata[@element='identifier' and @qualifier='loginURL']}" method="get">
                                    <button class="navbar-toggle navbar-link">
                                       <b class="visible-xs glyphicon glyphicon-user" aria-hidden="true"/>
                                    </button>
                                 </form>
                              </li>
                           </xsl:otherwise>
                        </xsl:choose>                        
                        <!-- Menu paginas estaticas -->
                        <li class="dropdown">
                           <button class="dropdown-toggle navbar-toggle navbar-link" data-toggle="dropdown">
                              <b class="visible-xs glyphicon glyphicon-info-sign" aria-hidden="true"/>
                           </button>
                           <ul class="dropdown-menu pull-right" role="menu" data-no-collapse="true">
                              <li role="presentation">
                                 <a class="text-decoration-a">
                                    <xsl:attribute name="href">
                                       <xsl:value-of select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='contextPath'][not(@qualifier)]"/>
                                       <xsl:text>/page/about</xsl:text>
                                    </xsl:attribute>
                                    <i18n:text>xmlui.mirage2.page-structure.about.navbar</i18n:text>
                                 </a>
                              </li>
                              <li role="presentation">
                                 <a class="text-decoration-a">
                                    <xsl:attribute name="href">
                                       <xsl:value-of select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='contextPath'][not(@qualifier)]"/>
                                       <xsl:text>/page/openaccess</xsl:text>
                                    </xsl:attribute>
                                    <i18n:text>xmlui.mirage2.page-structure.openaccess.navbar</i18n:text>
                                 </a>
                              </li>
                              <li role="presentation">
                                 <a class="text-decoration-a">
                                    <xsl:attribute name="href">
                                       <xsl:value-of select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='contextPath'][not(@qualifier)]"/>
                                       <xsl:text>/page/use</xsl:text>
                                    </xsl:attribute>
                                    <i18n:text>xmlui.mirage2.page-structure.use.navbar</i18n:text>
                                 </a>
                              </li>
                              <li role="presentation">
                                 <a class="text-decoration-a">
                                    <xsl:attribute name="href">
                                       <xsl:value-of select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='contextPath'][not(@qualifier)]"/>
                                       <xsl:text>/page/propiedadintelectual</xsl:text>
                                    </xsl:attribute>
                                    <i18n:text>xmlui.mirage2.page-structure.propiedadintelectual.navbar</i18n:text>
                                 </a>
                              </li>
                              <li role="presentation">
                                 <a class="text-decoration-a">
                                    <xsl:attribute name="href">
                                       <xsl:value-of select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='contextPath'][not(@qualifier)]"/>
                                       <xsl:text>/page/faq</xsl:text>
                                    </xsl:attribute>
                                    <i18n:text>xmlui.mirage2.page-structure.faq.navbar</i18n:text>
                                 </a>
                              </li>
                           </ul>
                        </li>                       
                     </ul> 
                  </div>                  
               <div class="navbar-header hidden-xs pull-right">                        
                            <!--<ul class="nav navbar-nav">                          
                              <xsl:call-template name="languageSelection"/>
                            </ul> -->
                              <ul class="nav navbar-nav">
                                    <xsl:choose>
                                    <xsl:when test="/dri:document/dri:meta/dri:userMeta/@authenticated = 'yes'">
                                          <li class="dropdown">
                                             <a id="user-dropdown-toggle" href="#" role="button" class="dropdown-toggle"
                                                data-toggle="dropdown">
                                                <span class="hidden-xs">
                                                      Hola,                                                    
                                                      <xsl:value-of select="/dri:document/dri:meta/dri:userMeta/
                                 dri:metadata[@element='identifier' and @qualifier= 'firstName'] "/>                                                      
                                                      <b class="caret"/>
                                                </span>
                                             </a>

                                             <ul class="dropdown-menu pull-right" role="menu"
                                                aria-labelledby="user-dropdown-toggle" data-no-collapse="true">
                                                <li>
                                                      <a href="{/dri:document/dri:meta/dri:userMeta/
                                 dri:metadata[@element='identifier' and @qualifier='url']}">
                                                         <i18n:text>xmlui.EPerson.Navigation.profile</i18n:text>
                                                      </a>
                                                </li>
                                                <li>
                                                      <a href="{/dri:document/dri:meta/dri:userMeta/
                                 dri:metadata[@element='identifier' and @qualifier='logoutURL']}">
                                                         <i18n:text>xmlui.dri2xhtml.structural.logout</i18n:text>
                                                      </a>
                                                </li>
                                             </ul>
                                          </li>
                                    </xsl:when>
                                    <xsl:otherwise>
                                       <ul class="nav navbar-nav pull-left hidden-sm">
                                          <button class="btn btn-primary btn-riunne" type="button">
                                             <a href="{/dri:document/dri:meta/dri:userMeta/dri:metadata[@element='identifier' and @qualifier='register']}">
                                                <span class="hidden-xs">
                                                      <i18n:text>xmlui.dri2xhtml.structural.register</i18n:text>
                                                </span>
                                             </a>
                                          </button>
                                       </ul>

                                       <ul class="nav navbar-nav pull-left hidden-sm">
                                          <button class="btn btn-primary btn-riunne" type="button">
                                             <a href="{/dri:document/dri:meta/dri:userMeta/dri:metadata[@element='identifier' and @qualifier='loginURL']}">
                                                <span class="hidden-xs">
                                                      <i18n:text>xmlui.dri2xhtml.structural.login</i18n:text>
                                                </span>
                                             </a>
                                          </button>
                                       </ul>
                                </xsl:otherwise>
                            </xsl:choose>
                        </ul>  
                        <button data-toggle="offcanvas" class="navbar-toggle visible-sm" type="button">
                           <span class="sr-only">
                              <i18n:text>xmlui.mirage2.page-structure.toggleNavigation</i18n:text>
                           </span>
                           <span class="icon-bar"></span>
                           <span class="icon-bar"></span>
                           <span class="icon-bar"></span>
                        </button>                 
               </div>     
            </div>
            <!-- Navbar personalizado con los botones para acceder a las paginas estaticas -->
               <div class="container-riunne hidden-xs" id="nav"> 
                                        
                     <ul>                         
                        <li>
                        <a>                                 
                           <xsl:attribute name="href">
                           <xsl:value-of select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='contextPath'][not(@qualifier)]"/>
                           <xsl:text>/page/about</xsl:text>
                           </xsl:attribute>
                           <i18n:text>xmlui.mirage2.page-structure.about.navbar</i18n:text>
                        </a>
                     </li>                                                      
                     <li>
                        <a>
                           <xsl:attribute name="href">
                              <xsl:value-of select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='contextPath'][not(@qualifier)]"/>
                              <xsl:text>/page/openaccess</xsl:text>
                           </xsl:attribute>
                           <i18n:text>xmlui.mirage2.page-structure.openaccess.navbar</i18n:text>
                        </a>
                     </li>
                     <li>
                        <a>
                           <xsl:attribute name="href">
                              <xsl:value-of select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='contextPath'][not(@qualifier)]"/>
                              <xsl:text>/page/use</xsl:text>
                           </xsl:attribute>
                           <i18n:text>xmlui.mirage2.page-structure.use.navbar</i18n:text>
                        </a>
                     </li>
                     <li>
                        <a>
                           <xsl:attribute name="href">
                              <xsl:value-of select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='contextPath'][not(@qualifier)]"/>
                              <xsl:text>/page/propiedadintelectual</xsl:text>
                           </xsl:attribute>
                           <i18n:text>xmlui.mirage2.page-structure.propiedadintelectual.navbar</i18n:text>
                        </a>
                     </li>
                     <li>
                        <a>
                           <xsl:attribute name="href">
                              <xsl:value-of select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='contextPath'][not(@qualifier)]"/>
                              <xsl:text>/page/faq</xsl:text>
                           </xsl:attribute>
                           <i18n:text>xmlui.mirage2.page-structure.faq.navbar</i18n:text>
                        </a>
                     </li>
                     <li>
                        <a>
                           <xsl:attribute name="href">
                           <xsl:value-of select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='contextPath'][not(@qualifier)]"/>
                           <xsl:text>/feedback</xsl:text>
                           </xsl:attribute>
                           <i18n:text>xmlui.dri2xhtml.structural.contact-link</i18n:text>
                        </a>
                     </li>

                  </ul>    
                   <div class="right">   
                        <a class="bi bi-facebook btn-social" style="color: #4267B2" href="https://es-la.facebook.com/RepositorioRiunne/" target="_blank">                             
                        </a>                      
                        <a class="bi bi-twitter btn-social" style="color: #1DA1F2" href="https://twitter.com/repositoriounne" target="_blank">                             
                        </a>
                        <a class="bi bi-youtube btn-social" style="color: #FF0000" href="https://www.youtube.com/channel/UCYqTLRim5pK3UGCFnF-vO3Q" target="_blank">                          
                        </a>                                                   
                     </div>                                 
               </div>           
         </div> 
            
      </header>   
   </xsl:template>    
   <!-- placeholders for header images --> 
   
   <xsl:template name="buildTrail">    
   <xsl:if test="''!=$request-uri">
      <div id="main-trail" class="trail-wrapper hidden-print">
         <div class="container-fluid">
            <div class="row"> 
               <!-- TODO -->                
                <div class="col-xs-12">
                  <xsl:choose>
                     <!-- Trails personalizados de las paginas estaticas -->
                     <!-- <xsl:when test="starts-with($request-uri, 'page/about')"> -->
                     <xsl:when test="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='request'][@qualifier='URI']='page/about'">
                        <ul class="breadcrumb">
                           <i18n:text>xmlui.mirage2.page-structure.about.trail</i18n:text>
                        </ul>
                     </xsl:when>
                     <xsl:when test="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='request'][@qualifier='URI']='page/dspace'">
                        <ul class="breadcrumb">
                           <i18n:text>xmlui.mirage2.page-structure.dspace.trail</i18n:text>
                        </ul>
                     </xsl:when>
                     <xsl:when test="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='request'][@qualifier='URI']='page/revistas'">
                        <ul class="breadcrumb">
                           <i18n:text>xmlui.mirage2.page-structure.revistas.trail</i18n:text>
                        </ul>
                     </xsl:when>
                     <xsl:when test="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='request'][@qualifier='URI']='page/openaccess'">
                        <ul class="breadcrumb">
                           <i18n:text>xmlui.mirage2.page-structure.openaccess.trail</i18n:text>
                        </ul>
                     </xsl:when>
                     <xsl:when test="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='request'][@qualifier='URI']='page/use'">
                        <ul class="breadcrumb">
                           <i18n:text>xmlui.mirage2.page-structure.use.trail</i18n:text>
                        </ul>
                     </xsl:when>
                     <xsl:when test="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='request'][@qualifier='URI']='page/propiedadintelectual'">
                        <ul class="breadcrumb">
                           <i18n:text>xmlui.mirage2.page-structure.propiedadintelectual.trail</i18n:text>
                        </ul>
                     </xsl:when>
                     <xsl:when test="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='request'][@qualifier='URI']='page/faq'">
                        <ul class="breadcrumb">
                           <i18n:text>xmlui.mirage2.page-structure.faq.trail</i18n:text>
                        </ul>
                     </xsl:when>
                     <xsl:when test="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='request'][@qualifier='URI']='page/novedades'">
                        <ul class="breadcrumb">
                           <i18n:text>xmlui.mirage2.page-structure.novedades.trail</i18n:text>
                        </ul>
                     </xsl:when>
                     <xsl:when test="count(/dri:document/dri:meta/dri:pageMeta/dri:trail) >1">
                        <div class="breadcrumb dropdown visible-xs">
                           <a id="trail-dropdown-toggle" href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">
                              <xsl:variable name="last-node" select="/dri:document/dri:meta/dri:pageMeta/dri:trail[last()]"/>
                              <xsl:choose>
                                 <xsl:when test="$last-node/i18n:*">
                                    <xsl:apply-templates select="$last-node/*"/>
                                 </xsl:when>
                                 <xsl:otherwise>
                                    <xsl:apply-templates select="$last-node/text()"/>
                                 </xsl:otherwise>
                              </xsl:choose>
                              <xsl:text>&#160;</xsl:text>
                              <b class="caret"/>
                           </a>
                           <ul class="dropdown-menu" role="menu" aria-labelledby="trail-dropdown-toggle">
                              <xsl:apply-templates select="/dri:document/dri:meta/dri:pageMeta/dri:trail" mode="dropdown"/>
                           </ul>
                        </div>
                        <ul class="breadcrumb hidden-xs">
                           <xsl:apply-templates select="/dri:document/dri:meta/dri:pageMeta/dri:trail"/>
                        </ul>
                     </xsl:when>                     
                     <xsl:otherwise>                       
                        <ul class="breadcrumb">
                           <xsl:apply-templates select="/dri:document/dri:meta/dri:pageMeta/dri:trail"/>
                        </ul>
                     </xsl:otherwise>
                   
                  </xsl:choose>
               </div>
            </div>
         </div>
      </div> 
      </xsl:if>
   </xsl:template>
   
  
   <!-- The Trail --> 
    <xsl:template match="dri:trail">
        <!-- put an arrow between the parts of the trail -->                   
        <li>
           <xsl:if test="position()=1">
              <i class="glyphicon glyphicon-home" aria-hidden="true"/>&#160;</xsl:if>
           <!-- Determine whether we are dealing with a link or plain text trail link -->
           <xsl:choose>
              <xsl:when test="./@target">
                 <a>
                    <xsl:attribute name="href">
                       <xsl:value-of select="./@target"/>
                    </xsl:attribute>
                    <xsl:apply-templates />
                 </a>
              </xsl:when>
              <xsl:otherwise>
                 <xsl:attribute name="class">active</xsl:attribute>
                 <xsl:apply-templates />
              </xsl:otherwise>
           </xsl:choose>
        </li>        
   </xsl:template>
  
  
   <xsl:template match="dri:trail" mode="dropdown">
      <!-- put an arrow between the parts of the trail -->
      <li role="presentation">
         <!-- Determine whether we are dealing with a link or plain text trail link -->
         <xsl:choose>
            <xsl:when test="./@target">
               <a role="menuitem">
                  <xsl:attribute name="href">
                     <xsl:value-of select="./@target"/>
                  </xsl:attribute>
                  <xsl:if test="position()=1">
                     <i class="glyphicon glyphicon-home" aria-hidden="true"/>&#160;</xsl:if>
                  <xsl:apply-templates />
               </a>
            </xsl:when>
            <xsl:when test="position() >1 and position() = last()">
               <xsl:attribute name="class">disabled</xsl:attribute>
               <a role="menuitem" href="#">
                  <xsl:apply-templates />
               </a>
            </xsl:when>
            <xsl:otherwise>
               <xsl:attribute name="class">active</xsl:attribute>
               <xsl:if test="position()=1">
                  <i class="glyphicon glyphicon-home" aria-hidden="true"/>&#160;</xsl:if>
               <xsl:apply-templates />
            </xsl:otherwise>
         </xsl:choose>
      </li>
   </xsl:template>

   <!-- The License -->
   <xsl:template name="cc-license">
      <xsl:param name="metadataURL"/>
      <xsl:variable name="externalMetadataURL">
         <xsl:text>cocoon:/</xsl:text>
         <xsl:value-of select="$metadataURL"/>
         <xsl:text>?sections=dmdSec,fileSec&amp;fileGrpTypes=THUMBNAIL</xsl:text>
      </xsl:variable>
      <xsl:variable name="ccLicenseName" select="document($externalMetadataURL)//dim:field[@element='rights']" />
      <xsl:variable name="ccLicenseUri" select="document($externalMetadataURL)//dim:field[@element='rights'][@qualifier='uri']" />
      <xsl:variable name="handleUri">
         <xsl:for-each select="document($externalMetadataURL)//dim:field[@element='identifier' and @qualifier='uri']">
            <a>
               <xsl:attribute name="href">
                  <xsl:copy-of select="./node()"/>
               </xsl:attribute>
               <xsl:copy-of select="./node()"/>
            </a>
            <xsl:if test="count(following-sibling::dim:field[@element='identifier' and @qualifier='uri']) != 0">
               <xsl:text>,</xsl:text>
            </xsl:if>
         </xsl:for-each>
      </xsl:variable>
      <xsl:if test="$ccLicenseName and $ccLicenseUri and contains($ccLicenseUri, 'creativecommons')">
         <div about="{$handleUri}" class="row">
            <div class="col-sm-3 col-xs-12">
               <a rel="license" href="{$ccLicenseUri}" alt="{$ccLicenseName}" title="{$ccLicenseName}" >
                  <xsl:call-template name="cc-logo">
                     <xsl:with-param name="ccLicenseName" select="$ccLicenseName"/>
                     <xsl:with-param name="ccLicenseUri" select="$ccLicenseUri"/>
                  </xsl:call-template>
               </a>
            </div>
            <div class="col-sm-8">
               <span>
                  <i18n:text>xmlui.dri2xhtml.METS-1.0.cc-license-text</i18n:text>
                  <xsl:value-of select="$ccLicenseName"/>
               </span>
            </div>
         </div>
      </xsl:if>
   </xsl:template>
   <xsl:template name="cc-logo">
      <xsl:param name="ccLicenseName"/>
      <xsl:param name="ccLicenseUri"/>
      <xsl:variable name="ccLogo">
         <xsl:choose>
            <xsl:when test="starts-with($ccLicenseUri, 'http://creativecommons.org/licenses/by/')">
               <xsl:value-of select="'cc-by.png'" />
            </xsl:when>
            <xsl:when test="starts-with($ccLicenseUri, 'http://creativecommons.org/licenses/by-sa/')">
               <xsl:value-of select="'cc-by-sa.png'" />
            </xsl:when>
            <xsl:when test="starts-with($ccLicenseUri, 'http://creativecommons.org/licenses/by-nd/')">
               <xsl:value-of select="'cc-by-nd.png'" />
            </xsl:when>
            <xsl:when test="starts-with($ccLicenseUri, 'http://creativecommons.org/licenses/by-nc/')">
               <xsl:value-of select="'cc-by-nc.png'" />
            </xsl:when>
            <xsl:when test="starts-with($ccLicenseUri, 'http://creativecommons.org/licenses/by-nc-sa/')">
               <xsl:value-of select="'cc-by-nc-sa.png'" />
            </xsl:when>
            <xsl:when test="starts-with($ccLicenseUri, 'http://creativecommons.org/licenses/by-nc-nd/')">
               <xsl:value-of select="'cc-by-nc-nd.png'" />
            </xsl:when>
            <xsl:when test="starts-with($ccLicenseUri, 'http://creativecommons.org/publicdomain/zero/')">
               <xsl:value-of select="'cc-zero.png'" />
            </xsl:when>
            <xsl:when test="starts-with($ccLicenseUri, 'http://creativecommons.org/publicdomain/mark/')">
               <xsl:value-of select="'cc-mark.png'" />
            </xsl:when>
            <xsl:otherwise>
               <xsl:value-of select="'cc-generic.png'" />
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <img class="img-responsive">
         <xsl:attribute name="src">
            <xsl:value-of select="concat($theme-path,'/images/creativecommons/', $ccLogo)"/>
         </xsl:attribute>
         <xsl:attribute name="alt">
            <xsl:value-of select="$ccLicenseName"/>
         </xsl:attribute>
      </img>
   </xsl:template>
   <!-- Like the header, the footer contains various miscellaneous text, links, and image placeholders -->
   <xsl:template name="buildFooter"></xsl:template>
   <!-- The meta, body, options elements; the three top-level elements in the schema -->
   <!-- The template to handle the dri:body element. It simply creates the ds-body div and applies -->
   <!-- templates of the body's child elements (which consists entirely of dri:div tags). -->
   <xsl:template match="dri:body">
      <div>
         <xsl:if test="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='alert'][@qualifier='message']">
            <div class="alert">
               <button type="button" class="close" data-dismiss="alert">&#215;</button>
               <xsl:copy-of select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='alert'][@qualifier='message']/node()"/>
            </div>
         </xsl:if>
         <!-- Check for the custom pages -->
         <xsl:choose>
            <!-- Static pages -->
            <xsl:when test="starts-with($request-uri, 'page/')">
               <xsl:variable name="active-locale" select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='page'][@qualifier='currentLocale']"/>
               <xsl:copy-of select="document(concat('../../',$request-uri,'_',$active-locale,'.xml') )" />
            </xsl:when>
            <!-- Otherwise use default handling of body -->
            <xsl:otherwise>
               <xsl:apply-templates />
            </xsl:otherwise>
         </xsl:choose>
      </div>
   </xsl:template>
   <!-- Currently the dri:meta element is not parsed directly. Instead, parts of it are referenced from inside -->
   <!-- other elements (like reference). The blank template below ends the execution of the meta branch -->
   <xsl:template match="dri:meta"></xsl:template>
   <!-- Meta's children: userMeta, pageMeta, objectMeta and repositoryMeta may or may not have templates of -->
   <!-- their own. This depends on the meta template implementation, which currently does not go this deep. -->
   <!-- <xsl:template match="dri:userMeta" /> -->
   <!-- <xsl:template match="dri:pageMeta" /> -->
   <!-- <xsl:template match="dri:objectMeta" /> -->
   <!-- <xsl:template match="dri:repositoryMeta" /> -->
   <xsl:template name="addJavascript">
      <!-- TODO concat & minify! -->
      <script>
         <xsl:text>if(!window.DSpace){window.DSpace={};}window.DSpace.context_path='</xsl:text>
         <xsl:value-of select="$context-path"/>
         <xsl:text>';window.DSpace.theme_path='</xsl:text>
         <xsl:value-of select="$theme-path"/>
         <xsl:text>';</xsl:text>
      </script>
      <!-- inject scripts.html containing all the theme specific javascript references -->
      <!-- that can be minified and concatinated in to a single file or separate and untouched -->
      <!-- depending on whether or not the developer maven profile was active -->
      <xsl:variable name="scriptURL">
         <xsl:text>cocoon://themes/</xsl:text>
         <!-- we can't use $theme-path, because that contains the context path, -->
         <!-- and cocoon:// urls don't need the context path -->
         <xsl:value-of select="$pagemeta/dri:metadata[@element='theme'][@qualifier='path']"/>
         <xsl:text>scripts-dist.xml</xsl:text>
      </xsl:variable>
      <xsl:for-each select="document($scriptURL)/scripts/script">
         <script src="{$theme-path}{@src}">&#160;</script>
      </xsl:for-each>
      <!-- Add javascipt specified in DRI -->
      <xsl:for-each select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='javascript'][not(@qualifier)]">
         <script>
            <xsl:attribute name="src">
               <xsl:value-of select="$theme-path"/>
               <xsl:value-of select="."/>
            </xsl:attribute>&#160;</script>
      </xsl:for-each>
      <!-- add "shared" javascript from static, path is relative to webapp root -->
      <xsl:for-each select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='javascript'][@qualifier='static']">
         <!-- This is a dirty way of keeping the scriptaculous stuff from choice-support -->
         <!-- out of our theme without modifying the administrative and submission sitemaps. -->
         <!-- This is obviously not ideal, but adding those scripts in those sitemaps is far -->
         <!-- from ideal as well -->
         <xsl:choose>
            <xsl:when test="text() = 'static/js/choice-support.js'">
               <script>
                  <xsl:attribute name="src">
                     <xsl:value-of select="$theme-path"/>
                     <xsl:text>js/choice-support.js</xsl:text>
                  </xsl:attribute>&#160;</script>
            </xsl:when>
            <xsl:when test="not(starts-with(text(), 'static/js/scriptaculous'))">
               <script>
                  <xsl:attribute name="src">
                     <xsl:value-of select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='contextPath'][not(@qualifier)]"/>
                     <xsl:text>/</xsl:text>
                     <xsl:value-of select="."/>
                  </xsl:attribute>&#160;</script>
            </xsl:when>
         </xsl:choose>
      </xsl:for-each>
      <!-- add setup JS code if this is a choices lookup page -->
      <xsl:if test="dri:body/dri:div[@n='lookup']">
         <xsl:call-template name="choiceLookupPopUpSetup"/>
      </xsl:if>
      <!-- Add a google analytics script if the key is present -->
      <xsl:if test="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='google'][@qualifier='analytics']">
         <script>
            <xsl:text>(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){ (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o), m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m) })(window,document,'script','//www.google-analytics.com/analytics.js','ga'); ga('create', '</xsl:text>
            <xsl:value-of select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='google'][@qualifier='analytics']"/>
            <xsl:text>', '</xsl:text>
            <xsl:value-of select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='request'][@qualifier='serverName']"/>
            <xsl:text>'); ga('send', 'pageview');</xsl:text>
         </script>
      </xsl:if>
   </xsl:template>

  <!--The Language Selection
        Uses a page metadata curRequestURI which was introduced by in /xmlui-mirage2/src/main/webapp/themes/Mirage2/sitemap.xmap-->
    <xsl:template name="languageSelection">
        <xsl:variable name="curRequestURI">
            <xsl:value-of select="substring-after(/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='curRequestURI'],/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='request'][@qualifier='URI'])"/>
        </xsl:variable>

        <xsl:if test="count(/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='page'][@qualifier='supportedLocale']) &gt; 1">
            <li id="ds-language-selection" class="dropdown">
                <xsl:variable name="active-locale" select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='page'][@qualifier='currentLocale']"/>
                <a id="language-dropdown-toggle" href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">
                    <span class="hidden-xs">
                        <xsl:value-of
                                select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='supportedLocale'][@qualifier=$active-locale]"/>
                        <xsl:text>&#160;</xsl:text>
                        <b class="caret"/>
                    </span>
                </a>
                <!--
                <ul class="dropdown-menu pull-right" role="menu" aria-labelledby="language-dropdown-toggle" data-no-collapse="true">
                    <xsl:for-each
                            select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='page'][@qualifier='supportedLocale']">
                        <xsl:variable name="locale" select="."/>
                        <li role="presentation">
                            <xsl:if test="$locale = $active-locale">
                                <xsl:attribute name="class">
                                    <xsl:text>disabled</xsl:text>
                                </xsl:attribute>
                            </xsl:if>
                            <a>
                                <xsl:attribute name="href">
                                    <xsl:value-of select="$curRequestURI"/>
                                    <xsl:call-template name="getLanguageURL"/>
                                    <xsl:value-of select="$locale"/>
                                </xsl:attribute>
                                <xsl:value-of
                                        select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='supportedLocale'][@qualifier=$locale]"/>
                            </a>
                        </li>
                    </xsl:for-each>
                </ul>-->
            </li>
        </xsl:if>
    </xsl:template>   
    <xsl:template name="getLanguageURL">
        <xsl:variable name="queryString" select="/dri:document/dri:meta/dri:pageMeta/dri:metadata[@element='request'][@qualifier='queryString']"/>
        <xsl:choose>
            <!-- There allready is a query string so append it and the language argument -->
            <xsl:when test="$queryString != ''">
                <xsl:text>?</xsl:text>
                <xsl:choose>
                    <xsl:when test="contains($queryString, '&amp;locale-attribute')">
                        <xsl:value-of select="substring-before($queryString, '&amp;locale-attribute')"/>
                        <xsl:text>&amp;locale-attribute=</xsl:text>
                    </xsl:when>
                    <!-- the query string is only the locale-attribute so remove it to append the correct one -->
                    <xsl:when test="starts-with($queryString, 'locale-attribute')">
                        <xsl:text>locale-attribute=</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$queryString"/>
                        <xsl:text>&amp;locale-attribute=</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>?locale-attribute=</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>