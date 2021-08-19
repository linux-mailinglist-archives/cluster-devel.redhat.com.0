Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id F37B23F223A
	for <lists+cluster-devel@lfdr.de>; Thu, 19 Aug 2021 23:26:21 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-oiIECdabNtKUzZDorbpnKQ-1; Thu, 19 Aug 2021 17:26:19 -0400
X-MC-Unique: oiIECdabNtKUzZDorbpnKQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB01587D541;
	Thu, 19 Aug 2021 21:26:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DBFF71970E;
	Thu, 19 Aug 2021 21:26:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 07F93181A0F7;
	Thu, 19 Aug 2021 21:26:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17JLQ9IK021920 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 19 Aug 2021 17:26:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7551F2097D77; Thu, 19 Aug 2021 21:26:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 70A322097D76
	for <cluster-devel@redhat.com>; Thu, 19 Aug 2021 21:26:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C2F6A800260
	for <cluster-devel@redhat.com>; Thu, 19 Aug 2021 21:26:06 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
	[209.85.215.176]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-558-HWbqmxclOlWukypTKCoVzA-1; Thu, 19 Aug 2021 17:26:04 -0400
X-MC-Unique: HWbqmxclOlWukypTKCoVzA-1
Received: by mail-pg1-f176.google.com with SMTP id c17so7132501pgc.0
	for <cluster-devel@redhat.com>; Thu, 19 Aug 2021 14:26:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/+4vlEEAudVfYKUxZZmR1avsO58lGkEG6r6/9NuzjB0=;
	b=TS0DMG9023fhJOgEvOnHzcL2+iyIL85Qxl3KMxIC1oRpBRmmqJAHQe9derNzwAwgBp
	5F1gY8K3s8++++LOTKN7jO+lzGj0SsmNhCwM8uk/CX6fWC93B17uzLU8bHHD3ygYZNyV
	sCKP24waqQcJjkeuGoY2z/Utm1F5nBXBUerJt1hnH7mfga0a5HPxGX21PEhhvIe/XHei
	M+q80QAlTpqKHVcBe1qmxqpZg4tZgseqiuW3TSm7D1VGE+Htw1ww4XBeA+In6QhBmIzX
	2TKZdEWzedVDYqJAlM71fRknWEwS3zKi0BZzLkji4COnrqgzVvZ+lR1donzl4JHymxxB
	ftMQ==
X-Gm-Message-State: AOAM533RHEIH38PH/xlKaCLCbwtTF4IELW4JYkR1FluIqetm5Z/i+3ZM
	UufVWzL7L7ijNT5g9swd5e2iUIKpJPRtpx/ikLaoaQ==
X-Google-Smtp-Source: ABdhPJzKZYtlwFa7VXvyk4oUfNnz7UdFBAgEuwiVTYzP34GSZ6p0NdAO9joIfVAHSnYYO/DjZcvseW3kcO9yjw3n+I0=
X-Received: by 2002:a63:311:: with SMTP id 17mr15597460pgd.450.1629408363613; 
	Thu, 19 Aug 2021 14:26:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210809061244.1196573-1-hch@lst.de>
	<20210809061244.1196573-12-hch@lst.de>
In-Reply-To: <20210809061244.1196573-12-hch@lst.de>
From: Dan Williams <dan.j.williams@intel.com>
Date: Thu, 19 Aug 2021 14:25:52 -0700
Message-ID: <CAPcyv4hbSYnOC6Pdi1QShRxGjBAteig7nN1h-5cEvsFDX9SuAQ@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: Linux NVDIMM <nvdimm@lists.linux.dev>, cluster-devel@redhat.com,
	"Darrick J. Wong" <djwong@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Shiyang Ruan <ruansy.fnst@fujitsu.com>,
	linux-xfs <linux-xfs@vger.kernel.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	linux-btrfs <linux-btrfs@vger.kernel.org>
Subject: Re: [Cluster-devel] [PATCH 11/30] iomap: add the new iomap_iter
	model
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Sun, Aug 8, 2021 at 11:23 PM Christoph Hellwig <hch@lst.de> wrote:
>
> The iomap_iter struct provides a convenient way to package up and
> maintain all the arguments to the various mapping and operation
> functions.  It is operated on using the iomap_iter() function that
> is called in loop until the whole range has been processed.  Compared
> to the existing iomap_apply() function this avoid an indirect call
> for each iteration.
>
> For now iomap_iter() calls back into the existing ->iomap_begin and
> ->iomap_end methods, but in the future this could be further optimized
> to avoid indirect calls entirely.
>
> Based on an earlier patch from Matthew Wilcox <willy@infradead.org>.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/iomap/Makefile     |  1 +
>  fs/iomap/core.c       | 79 +++++++++++++++++++++++++++++++++++++++++++
>  fs/iomap/trace.h      | 37 +++++++++++++++++++-
>  include/linux/iomap.h | 56 ++++++++++++++++++++++++++++++
>  4 files changed, 172 insertions(+), 1 deletion(-)
>  create mode 100644 fs/iomap/core.c
>
> diff --git a/fs/iomap/Makefile b/fs/iomap/Makefile
> index eef2722d93a183..6b56b10ded347a 100644
> --- a/fs/iomap/Makefile
> +++ b/fs/iomap/Makefile
> @@ -10,6 +10,7 @@ obj-$(CONFIG_FS_IOMAP)                += iomap.o
>
>  iomap-y                                += trace.o \
>                                    apply.o \
> +                                  core.o \
>                                    buffered-io.o \
>                                    direct-io.o \
>                                    fiemap.o \
> diff --git a/fs/iomap/core.c b/fs/iomap/core.c
> new file mode 100644
> index 00000000000000..89a87a1654e8e6
> --- /dev/null
> +++ b/fs/iomap/core.c
> @@ -0,0 +1,79 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2021 Christoph Hellwig.
> + */
> +#include <linux/fs.h>
> +#include <linux/iomap.h>
> +#include "trace.h"
> +
> +static inline int iomap_iter_advance(struct iomap_iter *iter)
> +{
> +       /* handle the previous iteration (if any) */
> +       if (iter->iomap.length) {
> +               if (iter->processed <= 0)
> +                       return iter->processed;
> +               if (WARN_ON_ONCE(iter->processed > iomap_length(iter)))
> +                       return -EIO;
> +               iter->pos += iter->processed;
> +               iter->len -= iter->processed;
> +               if (!iter->len)
> +                       return 0;
> +       }
> +
> +       /* clear the state for the next iteration */
> +       iter->processed = 0;
> +       memset(&iter->iomap, 0, sizeof(iter->iomap));
> +       memset(&iter->srcmap, 0, sizeof(iter->srcmap));
> +       return 1;
> +}
> +
> +static inline void iomap_iter_done(struct iomap_iter *iter)
> +{
> +       WARN_ON_ONCE(iter->iomap.offset > iter->pos);
> +       WARN_ON_ONCE(iter->iomap.length == 0);
> +       WARN_ON_ONCE(iter->iomap.offset + iter->iomap.length <= iter->pos);
> +
> +       trace_iomap_iter_dstmap(iter->inode, &iter->iomap);
> +       if (iter->srcmap.type != IOMAP_HOLE)
> +               trace_iomap_iter_srcmap(iter->inode, &iter->srcmap);

Given most of the iomap_iter users don't care about srcmap, i.e. are
not COW cases, they are leaving srcmap zero initialized. Should the
IOMAP types be incremented by one so that there is no IOMAP_HOLE
confusion? In other words, fold something like this?

diff --git a/include/linux/iomap.h b/include/linux/iomap.h
index 479c1da3e221..b9c62d0909b0 100644
--- a/include/linux/iomap.h
+++ b/include/linux/iomap.h
@@ -21,14 +21,23 @@ struct page;
 struct vm_area_struct;
 struct vm_fault;

-/*
- * Types of block ranges for iomap mappings:
+/**
+ * enum iomap_type - Types of block ranges for iomap mappings
+ * @IOMAP_NONE: invalid iomap
+ * @IOMAP_HOLE: no blocks allocated, need allocation
+ * @IOMAP_DELALLOC: delayed allocation blocks
+ * @IOMAP_MAPPED: blocks allocated at @addr
+ * @IOMAP_UNWRITTEN: blocks allocated at @addr in unwritten state
+ * @IOMAP_INLINE: data inline in the inode
  */
-#define IOMAP_HOLE     0       /* no blocks allocated, need allocation */
-#define IOMAP_DELALLOC 1       /* delayed allocation blocks */
-#define IOMAP_MAPPED   2       /* blocks allocated at @addr */
-#define IOMAP_UNWRITTEN        3       /* blocks allocated at @addr
in unwritten state */
-#define IOMAP_INLINE   4       /* data inline in the inode */
+enum iomap_type {
+       IOMAP_NONE = 0,
+       IOMAP_HOLE,
+       IOMAP_DELALLOC
+       IOMAP_MAPPED,
+       IOMAP_UNWRITTEN,
+       IOMAP_INLINE,
+};

 /*
  * Flags reported by the file system from iomap_begin:


> +}
> +
> +/**
> + * iomap_iter - iterate over a ranges in a file
> + * @iter: iteration structue

s/structue/structure/

Other than the minor stuff above, looks good to me:

Reviewed-by: Dan Williams <dan.j.williams@intel.com>

