// Chapter selection and loading functionality

class ChapterLoader {
    constructor() {
        this.chapterListElement = document.getElementById('chapter-list');
        this.chapterSelectionElement = document.getElementById('chapter-selection');
        this.storyElement = document.getElementById('story');
        this.loadChapters();
    }

    async loadChapters() {
        try {
            // Get list of chapters from the chapters directory
            const chapters = await this.fetchChapterList();
            this.displayChapters(chapters);
        } catch (error) {
            console.error('Failed to load chapters:', error);
            this.displayError();
        }
    }

    async fetchChapterList() {
        // Since we can't easily list directory contents in a browser,
        // we'll maintain a manifest of available chapters
        const chapters = [
            { name: 'Prelude: Dying Embers', file: 'Prelude: Dying Embers.json' }
        ];
        
        // Verify each chapter file exists
        const availableChapters = [];
        for (const chapter of chapters) {
            try {
                const response = await fetch(`chapters/${chapter.file}`);
                if (response.ok) {
                    availableChapters.push(chapter);
                }
            } catch (error) {
                console.warn(`Chapter ${chapter.name} not found`);
            }
        }
        
        return availableChapters;
    }

    displayChapters(chapters) {
        this.chapterListElement.innerHTML = '';
        
        if (chapters.length === 0) {
            this.displayError();
            return;
        }

        chapters.forEach(chapter => {
            const button = document.createElement('a');
            button.textContent = chapter.name;
            button.href = '#';
            button.onclick = (e) => {
                e.preventDefault();
                this.loadChapter(chapter.file, chapter.name);
            };
            this.chapterListElement.appendChild(button);
        });
    }

    displayError() {
        this.chapterListElement.innerHTML = '<p>No chapters available. Please build the stories first using <code>make</code>.</p>';
    }

    async loadChapter(chapterFile, chapterName) {
        try {
            const response = await fetch(`chapters/${chapterFile}`);
            if (!response.ok) {
                throw new Error(`Failed to load chapter: ${response.status}`);
            }
            
            const storyData = await response.json();
            this.startStory(storyData, chapterName);
            
        } catch (error) {
            console.error('Failed to load chapter:', error);
            alert('Failed to load chapter. Please try again.');
        }
    }

    startStory(storyData, chapterName) {
        // Hide chapter selection and show story
        this.chapterSelectionElement.style.display = 'none';
        this.storyElement.style.display = 'block';
        
        // Enable the controls when playing a chapter
        const controls = document.getElementById('controls');
        if (controls) {
            controls.classList.remove('disabled');
        }
        
        // Initialize the story with the loaded data and chapter name
        if (window.startStoryWithData) {
            window.startStoryWithData(storyData, chapterName);
        } else {
            console.error('Story initialization function not found');
        }
    }

    showChapterSelection() {
        // Show chapter selection and hide story
        this.chapterSelectionElement.style.display = 'block';
        this.storyElement.style.display = 'none';
        
        // Disable the controls when at chapter selection
        const controls = document.getElementById('controls');
        if (controls) {
            controls.classList.add('disabled');
        }
    }
}

// Initialize chapter loader when DOM is ready
document.addEventListener('DOMContentLoaded', () => {
    window.chapterLoader = new ChapterLoader();
});