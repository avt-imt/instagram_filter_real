<style>

.slider {
  width: 100% !important;
}


</style>

<div class="col-12" id="ratingform" >

% is_audio = False
% is_image = stimuli_file.split(".")[-1].lower() in ["jpg", "jpeg", "png", "gif", "tiff"]
% is_video = False



<h5>Please rate the following aspects for the shown image.</h5>

    <style type="text/css">
    .slider::-webkit-slider-thumb  {
      background: #007bff;
    }
    .slider::-moz-range-thumb {
      background: #007bff;
    }
    .slider::-ms-thumb {
      background: #007bff;
    }
    </style>


  % route = f"save_rating?stimuli_idx={stimuli_idx}" if not train else "training/" + str(stimuli_idx + 1)
  <form id="form1" action="/{{route}}" method="post">

<%

is_av = "_av_" in stimuli_file and not is_audio


groups = [
    {
        "group": "",
        "adjectives": ["image appeal", "image quality", "realism"]
    }
]


%>

    <table class="table table-sm">
      <thead>
        <tr>
          <th scope="col"></th>
          <th scope="col"></th>
          <th scope="col"></th>
          <th scope="col">low</th>
          <th scope="col" style="text-align:center"></th>
          <th scope="col">high</th>
        </tr>
      </thead>
      <tbody>
        % for g in groups:

            <tr><th colspan="5">{{g["group"]}}</th></tr>
            % for adj in g["adjectives"]:
              % adj_key = g["group"] + adj.replace(" ", "_")
            <tr>
              <td style="width:5%"></td>
              <td style="width:15%" >{{adj}} </td>
              <td style="width:15%" ><input type="number" id="label_range_{{adj_key}}" style="width:3em" onchange="update_slider(this, 'range_{{adj_key}}')" required></td>

              <td style="width:8em">1</td>
              <td style="width:50%">

                <input
                    type="range"
                    class="form-range slider"
                    name="range_{{adj_key}}"
                    id="range_{{adj_key}}"
                    min="1"
                    max="5"
                    value="3"
                    oninput="slider_change(this)"
                    onchange="slider_change(this)"
                />
                <datalist id="steplist">
                  <option>1</option>
                  <option>2</option>
                  <option>3</option>
                  <option>4</option>
                  <option>5</option>
                </datalist>

              </td>
              <td style="width:8em">5</th>
            </tr>
            % end
        %end
      </tbody>
    </table>

    % include('templates/rating/common.tpl', stimuli_file=stimuli_file)


    <button type="submit" id="submitButton" class="btn btn-success btn-block" disabled>submit</button>
    % if dev:
      <button type="submit" class="btn btn-success" formnovalidate>skip (for dev)</button>
    % end

  </form>
</div>



<script>
    var slidersChanged = {};
    // initialize sliders
    for (const slider of document.querySelectorAll('input.slider')) {
      slidersChanged[slider.getAttribute("name")] = 0;
    }
    function update_slider(input, range_id) {
        var slider = document.getElementById(range_id);
        slider.value = input.value
    }

    function slider_change(slider) {
        console.log("change");
        const label = document.getElementById("label_" + slider.getAttribute("name"));
        //label.textContent = slider.value;
        label.value = slider.value;

        slidersChanged[slider.getAttribute("name")] = 1;
        var check = Object.values(slidersChanged).every(e => e > 0);

        if (check) {
            document.getElementById("submitButton").disabled = false;
        }
    }
    function display_rating(){
        document.getElementById("ratingform").style.display="block";
    }

</script>