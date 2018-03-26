/*
 * Copyright (c) 2018 The Foundation for Research on Information Technologies in Society (IT'IS).
 * 
 * This file is part of iSEG
 * (see https://github.com/ITISFoundation/osparc-iseg).
 * 
 * This software is released under the MIT License.
 *  https://opensource.org/licenses/MIT
 */
namespace InternalUse
{
	bool m_IsForInternalUse;

	bool IsForInternalUse() { return m_IsForInternalUse; }
	void SetForInternalUse( bool forInternalUse ) { m_IsForInternalUse = forInternalUse; }
};