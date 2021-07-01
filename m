Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 22C223B9850
	for <lists+cluster-devel@lfdr.de>; Thu,  1 Jul 2021 23:46:29 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-qZX7Y9slNdGrQ6LInfS_xw-1; Thu, 01 Jul 2021 17:46:27 -0400
X-MC-Unique: qZX7Y9slNdGrQ6LInfS_xw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1982F1084F4B;
	Thu,  1 Jul 2021 21:46:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F8865D6A8;
	Thu,  1 Jul 2021 21:46:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 756B11809C99;
	Thu,  1 Jul 2021 21:46:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 161LfdMK014244 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 1 Jul 2021 17:41:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BC91110F02D; Thu,  1 Jul 2021 21:41:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B76E8107668
	for <cluster-devel@redhat.com>; Thu,  1 Jul 2021 21:41:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4C65280D090
	for <cluster-devel@redhat.com>; Thu,  1 Jul 2021 21:41:36 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
	[209.85.167.44]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-22-tPEVAS6FO1yhc7oBbFqG8w-1; Thu, 01 Jul 2021 17:41:34 -0400
X-MC-Unique: tPEVAS6FO1yhc7oBbFqG8w-1
Received: by mail-lf1-f44.google.com with SMTP id f30so14435052lfj.1
	for <cluster-devel@redhat.com>; Thu, 01 Jul 2021 14:41:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=cSLIj5ijLv21MczqPZ//LmnEGNGY+Io9XntuI4cnzoQ=;
	b=OMN9BvxKa2B5yiaktWjJnmylZ8xQgGUr6t0v0/qnbsPHZMD7kA6vuBGy+c3gFHozbU
	LGH9MFPdvu1D/KzPvZjDkb52FD4Zz55kgC12ZJNAFvApWTK2WsDyQm+Oa2HJlDSZ8fTf
	BM9AViXXdZz2+9RMdUdPomkvyIH+05sNWG/EPaM3R4j84TP22YLqctRlrB+7+ysgt6AX
	1Np0AJWJscvA5Bd8mKBw0UA+pdaorGGZqPEm2xAG4fshxIgohO9xcJwgMBbJtAC1lVRF
	TtzuS/7XyfjyFe2fKGg2DHyzOoTFJPqsd0SdTpaJz0qGylHwY+Zt0jEKyJV0MEd0wyxa
	R+QQ==
X-Gm-Message-State: AOAM533vRcN9vrM5sPLHnGZFNyXQG3fNuSqaqtQTRsLgrIzWiW6QY69U
	B18AejtaHVMRPuclIg7+YfUgptgAGHXNlUJSWh8=
X-Google-Smtp-Source: ABdhPJz8HL536soLC2TN5+0OVgFLZIAGKC95+8oLgBmcnR558/dvEzyxj0sWgUWrZeROKOG/1NsJ/w==
X-Received: by 2002:a19:650f:: with SMTP id z15mr1213995lfb.511.1625175692354; 
	Thu, 01 Jul 2021 14:41:32 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com.
	[209.85.208.181])
	by smtp.gmail.com with ESMTPSA id h37sm81342lfv.85.2021.07.01.14.41.31
	for <cluster-devel@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 01 Jul 2021 14:41:31 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id u25so10439796ljj.11
	for <cluster-devel@redhat.com>; Thu, 01 Jul 2021 14:41:31 -0700 (PDT)
X-Received: by 2002:a05:651c:32e:: with SMTP id
	b14mr1183040ljp.251.1625175691224; 
	Thu, 01 Jul 2021 14:41:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210701204246.2037142-1-agruenba@redhat.com>
In-Reply-To: <20210701204246.2037142-1-agruenba@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 1 Jul 2021 14:41:15 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjk6KP3vSLFNPMjoaZ4xY4u=DjTM+C+hCS3QKt+XAE6OA@mail.gmail.com>
Message-ID: <CAHk-=wjk6KP3vSLFNPMjoaZ4xY4u=DjTM+C+hCS3QKt+XAE6OA@mail.gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>, Jan Kara <jack@suse.cz>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Matthew Wilcox <willy@infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [Cluster-devel] [PATCH] gfs2: Fix mmap + page fault deadlocks
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 1, 2021 at 1:43 PM Andreas Gruenbacher <agruenba@redhat.com> wrote:
>
> here's another attempt at fixing the mmap + page fault deadlocks we're
> seeing on gfs2.  Still not ideal because get_user_pages_fast ignores the
> current->pagefault_disabled flag

Of course get_user_pages_fast() ignores the pagefault_disabled flag,
because it doesn't do any page faults.

If you don't want to fall back to the "maybe do IO" case, you should
use the FOLL_FAST_ONLY flag - or get_user_pages_fast_only(), which
does that itself.

> For getting get_user_pages_fast changed to fix this properly, I'd need
> help from the memory management folks.

I really don't think you need anything at all from the mm people,
because we already support that whole "fast only" case.

Also, I have to say that I think the direct-IO code is fundamentally
mis-designed. Why it is doing the page lookup _during_ the IO is a
complete mystery to me. Why wasn't that done ahead of time before the
filesystem took the locks it needed?

So what the direct-IO code _should_ do is to turn an ITER_IOVEC into a
ITER_KVEC by doing the page lookup ahead of time, and none of these
issues should even exist, and then the whole pagefault_disabled and/or
FOLL_FAST_ONLY would be a complete non-issue.

Is there any reason why that isn't what it does (other than historical baggage)?

               Linus

