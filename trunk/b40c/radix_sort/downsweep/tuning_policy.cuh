/******************************************************************************
 * 
 * Copyright 2010-2011 Duane Merrill
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License. 
 * 
 * For more information, see our Google Code project site: 
 * http://code.google.com/p/back40computing/
 * 
 * Thanks!
 * 
 ******************************************************************************/


/******************************************************************************
 * Downsweep tuning configuration policy
 ******************************************************************************/

#pragma once

#include <b40c/util/io/modified_load.cuh>
#include <b40c/util/io/modified_store.cuh>

#include <b40c/partition/downsweep/tuning_policy.cuh>

namespace b40c {
namespace radix_sort {
namespace downsweep {


/**
 * Downsweep tuning configuration policy.
 * 
 * See constraints in base class.
 */
template <
	typename ProblemType,

	int CUDA_ARCH,
	int LOG_BINS,
	int LOG_SCHEDULE_GRANULARITY,
	int CTA_OCCUPANCY,
	int LOG_THREADS,
	int LOG_LOAD_VEC_SIZE,
	int LOG_LOADS_PER_CYCLE,
	int LOG_CYCLES_PER_TILE,
	int LOG_RAKING_THREADS,
	util::io::ld::CacheModifier READ_MODIFIER,
	util::io::st::CacheModifier WRITE_MODIFIER,
	bool TWO_PHASE_SCATTER,
	bool _EARLY_EXIT>

struct TuningPolicy :
	partition::downsweep::TuningPolicy <
		ProblemType,
		CUDA_ARCH,
		LOG_BINS,
		LOG_SCHEDULE_GRANULARITY,
		CTA_OCCUPANCY,
		LOG_THREADS,
		LOG_LOAD_VEC_SIZE,
		LOG_LOADS_PER_CYCLE,
		LOG_CYCLES_PER_TILE,
		LOG_RAKING_THREADS,
		READ_MODIFIER,
		WRITE_MODIFIER,
		TWO_PHASE_SCATTER>
{
	enum {
		EARLY_EXIT									= _EARLY_EXIT,
	};
};

} // namespace downsweep
} // namespace radix_sort
} // namespace b40c

