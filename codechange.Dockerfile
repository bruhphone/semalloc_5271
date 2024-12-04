FROM semalloc:latest

# clear semalloc
# RUN rm -r /app/semalloc
# RUN mkdir /app/semalloc

# copy semalloc
COPY . /app/semalloc

# build semalloc frontend
RUN mkdir -p /app/semalloc/frontend/build
WORKDIR /app/semalloc/frontend/build

RUN LLVM_DIR=/app/llvm15/build/lib/cmake/llvm cmake ..
RUN make -j6

# build semalloc backend
RUN mkdir -p /app/semalloc/backend/build
WORKDIR /app/semalloc/backend/build
RUN LLVM_DIR=/app/llvm15/build/lib/cmake/llvm cmake -DGLIBC_OVERRIDE=ON ..
RUN make -j6