import { createElement } from 'lwc';
import Assignment2GetPicklistObjInfoOpp from 'c/assignment2GetPicklistObjInfoOpp';

describe('c-assignment2-get-picklist-obj-info-opp', () => {
    afterEach(() => {
        // The jsdom instance is shared across test cases in a single file so reset the DOM
        while (document.body.firstChild) {
            document.body.removeChild(document.body.firstChild);
        }
    });

    it('TODO: test case generated by CLI command, please fill in test logic', () => {
        // Arrange
        const element = createElement('c-assignment2-get-picklist-obj-info-opp', {
            is: Assignment2GetPicklistObjInfoOpp
        });

        // Act
        document.body.appendChild(element);

        // Assert
        // const div = element.shadowRoot.querySelector('div');
        expect(1).toBe(1);
    });
});