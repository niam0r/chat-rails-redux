import { FETCH_MESSAGES, MESSAGE_POSTED, CHANNEL_SELECTED } from '../actions';

export default function(state = null, action) {
  switch (action.type) {
    case FETCH_MESSAGES:
      return action.payload;
      // return action.payload.messages;
    case MESSAGE_POSTED:
      if (state.map(message => message.id).includes(action.payload.id)) {
        return state;
      } else {
        return [...state, action.payload];
      }
    case CHANNEL_SELECTED:
      return []; // Channel has changed. Clearing view.
    default:
      return state;
  }
}
