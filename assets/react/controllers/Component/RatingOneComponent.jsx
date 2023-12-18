import React from "react";
import { Rating, Heart } from "@smastrom/react-rating";
import "@smastrom/react-rating/style.css";

function RatingOneComponent( props ) {

    const note = props.note;

    const rateStyles = {
        itemShapes: Heart,
        activeFillColor: "#ff0000",
        inactiveFillColor: "#acaba1",
    }

    
  return (
    <div className="  w-[100px]">
    {note ? (
        <Rating
            className="pt-1 h-[18px]"
            readOnly
            value={note}
            itemStyles={rateStyles}
        />
    ) : (
        <span>Pas de note</span>
    )}
</div>
  )
}
export default RatingOneComponent