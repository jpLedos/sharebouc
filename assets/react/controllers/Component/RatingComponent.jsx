import React from "react";
import { Rating, Heart } from "@smastrom/react-rating";
import "@smastrom/react-rating/style.css";

import {ArrayAvgNote} from '../Services/Functions'

function RatingComponent( props ) {

    const book = JSON.parse(props.book);
    const note = ArrayAvgNote(book.userBooks);

    const rateStyles = {
        itemShapes: Heart,
        activeFillColor: "#ff0000",
        inactiveFillColor: "#acaba1",
    }

  return (
    <div className="mx-auto text-center  w-[200px] my-3 ">
    {note ? (
        <Rating
            className="pt-1 h-[30px]"
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
export default RatingComponent