% rebase('templates/skeleton.tpl', title=title)

<h1 class="mt-5">Instructions</h1>

<div id="screensize_error" class="alert alert-danger" style="display:none">
    Your browser window is not large enough, please maximize your window.
</div>

<p>
You will see differently images.
The task will then be to evaluate the following aspects of the shown images.
</p>
<ul>
    <li>image appeal (1-5 scale; 1=bad, 5=very good): refers to the quality of being attractive or interesting</li>
    <li>image quality (1-5 scale; 1=bad, 5=very good): refers to the technical quality of the images (e.g. considering visual distortions) </li>
    <li>realism (1-5; 1=bad, 5=very good): how realistic is the image </li>
 <!--   <li>is the image matching a given text as description</li> -->

</ul>

<!--
<p>
The training phase comprises shows you the rating scheme and the general interface.
</p>
-->

<div class="alert alert-secondary" role="alert">
Please answer as intuitive as possible. There are no right or wrong answers.
</div>
<div class="alert alert-secondary" role="alert">
Please maximize your browser window.
</div>

<p>
<a class="btn btn-large btn-success" href="{{next}}" onclick="check_screensize(event)"  id="next">next</a>
</p>



% include("templates/precache.tpl", stimuli=stimuli)
