import React, { useEffect, useRef, useState } from "react";
import Book from "./Book";
import { MultiSelect } from "primereact/multiselect";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faFilterCircleXmark } from '@fortawesome/free-solid-svg-icons'


function Books(props) {
    const books = JSON.parse(props.books);
    const kinds = JSON.parse(props.kinds);
    const status = JSON.parse(props.status);
    const users = JSON.parse(props.users);
    
    
    const [filterKinds, setFilterKinds] = useState([]);
    const [filterStatus, setFilterStatus] = useState([]);
    const [filterUser, setFilterUser] = useState("");
    const [search, setSearch] = useState("");
    
    const [displayedBooks,setDisplayedBooks] = useState(books);
    
    function handleResetFilter() {
        setFilterKinds([])
        setFilterStatus([])
        setFilterUser("")
        setSearch("")
    }

    useEffect(()=>{   
        updateDisplayedBooks()
    },[filterStatus, filterKinds, filterUser, search])

    function updateDisplayedBooks(){

        let filteredBooksToSearch = books
        
        //on filtre si on a selectionné un status  
        let filteredBooksByStatus = books
        if(filteredBooksToSearch && filterStatus.length > 0 ){
            filteredBooksToSearch=books.filter(book => {
                let selected = false
                book.userBooks.forEach(userBook => { 
                    if(userBook.user.pseudo == props.pseudo && filterStatus.includes(userBook.status.id)){
                        selected = true  
                    }  
                })
                    
                return selected}
            )
        }
        
        //on filtre si on a selectionné un genre
        if(filteredBooksToSearch && filterKinds.length > 0 ){
            filteredBooksToSearch = filteredBooksToSearch.filter(book => {
                let selected = false
                book.kinds.forEach(kind => {
                    if(filterKinds.includes(kind.id))
                        selected = true
                    })

                return selected}
            )
        }

        // on refiltre si un user a été selectionné
        if(filterUser != ''){
            filteredBooksToSearch = filteredBooksToSearch.filter(book =>{
                let selected = false
                book.userBooks.forEach(userBook => { 
                    if(userBook.user.id == parseInt(filterUser)){
                        selected = true  
                    }  
                })
                return selected
            }) 
             
        }

        // on refiltre si 3 caracteres dans recherche
        if(search.length >= 3){
            filteredBooksToSearch = filteredBooksToSearch.filter(book=>{
                let selected = false
                book.authors.forEach(author => {
                    if(author.name.toLowerCase().includes(search.toLowerCase())){
                        selected = true
                    }
                })
                if(book.title.toLowerCase().includes(search.toLowerCase())){
                    selected = true
                }
                return selected
                })
        }

        // et on met enfin a jour le state
        setDisplayedBooks(filteredBooksToSearch)
    }


    return (
        <>
            <details  className="" open>
            <summary className="text-semibold text-xl cursor-pointer pt-4">Filtres 
           
            <button className="mx-4" onClick={handleResetFilter}><FontAwesomeIcon icon={faFilterCircleXmark} /></button>
            </summary>
            <div className="flex flex-col justify-center items-center md:flex-row text-center">

                    <MultiSelect
                        value={filterStatus}
                        onChange={(e) => setFilterStatus(e.target.value)}
                        options={status}
                        optionLabel="name"
                        optionValue="id"
                        display="chip"
                        placeholder="Filtre sur ses statuts"
                        maxSelectedLabels={3}
                        className="w-60 m-1 rounded px-2 py-1 bg-stone-500 text-white hover:bg-stone-600"
                    />
                    <MultiSelect
                        value={filterKinds}
                        onChange={(e) => setFilterKinds(e.target.value)}
                        options={kinds}
                        optionLabel="name"
                        optionValue="id"
                        display="chip"
                        placeholder="Filtre sur les genres"
                        maxSelectedLabels={3}
                        className="w-60 m-1 rounded px-2 py-1 bg-zinc-600 text-white hover:bg-slate-500"
                    />
                    <select
                        value={filterUser}
                        className="w-60 m-1 rounded px-2 py-1 bg-stone-400 hover:bg-stone-300"
                        onChange={(e) => setFilterUser(e.target.value)}
                    > <option className="text-center" value="">{filterUser =="" ? "Liste d'un utilisateur" : "Tous les utilisateurs"}</option>
                        {users.map((user,index) => {
                            return (
                                <option
                                    // selected={status.id === statusId}
                                    key={index}
                                    value={user.id}
                                >
                                    {user.pseudo}
                                </option>
                            );
                        })}
                    </select>

                    <input 
                    placeholder="Chercher par titre ou Auteur"
                    className="w-60 m-1 rounded px-2 py-1"
                    type="text" 
                    value={search} 
                    onChange={e=>setSearch(e.target.value)} />
            </div>
            </details>
            {!displayedBooks.length &&
            <p className="m-5 text-xl font-semibold">Aucun livre ne répond aux critères de recherche !</p>
            }
            <div className="books-grid-container">
                {displayedBooks.map((book, index) => {
                    return (
                        <div key={index}>
                            <Book
                                book={book}
                                currentUser={props.pseudo}
                            />
                        </div>
                    );
                })}
            </div>
        </>
    );
}
export default Books;
