		
		
	<link rel="stylesheet" href="{$config.url}layout/css/worldTimeline.css" type="text/css"/>




  <section id="timeline">

    <div class="timeline">
        <canvas id="cvs3" width="1280" height="1029"></canvas> 
        <article> 
            {foreach from = $leftSide item = item}
             <figure> 
                <figcaption>{$item.value}</figcaption>
                <h6>{$item.title}</h6>
                <p>{$item.description}</p>
            </figure>
            {/foreach}
            
        </article>

        <article>
            {foreach from = $rightSide item = item}
             <figure> 
                <figcaption>{$item.value}</figcaption>
                <h6>{$item.title}</h6>
                <p>{$item.description}</p>
            </figure>
            {/foreach}
           
        </article>
        <br style="clear:both">
    </div>

</section>

<script type="text/javascript" src='{$config.url}layout/js/worldTimeline.js'></script>

<h1>Average skill levels of hackers zone wide</h1>
<hr/>
<div class="row mb10">
{foreach $skills as $skill}
	<div class="col-md-6">
		<div class="row mb10">
		<div class="col-xs-8">
			<button disabled class="text-left">{$skill.name}</button>
		</div>
		<div class="col-xs-4">
			<button disabled>{$skill.avg.0.level|round:1}</button>
		</div>
		</div>
	</div>
{/foreach}
</div>
<div class="text-center">
<em><small>only hackers with level higher than 3 are taken into account</small></em>
</div>