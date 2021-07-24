Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 31FC13D49B4
	for <lists+cluster-devel@lfdr.de>; Sat, 24 Jul 2021 21:53:07 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-dVKLB8lJPuyDfM7xcadwjg-1; Sat, 24 Jul 2021 15:53:05 -0400
X-MC-Unique: dVKLB8lJPuyDfM7xcadwjg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DCEA11074664;
	Sat, 24 Jul 2021 19:53:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9AA705C1D0;
	Sat, 24 Jul 2021 19:53:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4E8AE180BAB1;
	Sat, 24 Jul 2021 19:53:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16OJqv2q020180 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 24 Jul 2021 15:52:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D5ADE2156897; Sat, 24 Jul 2021 19:52:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D0DEF2156896
	for <cluster-devel@redhat.com>; Sat, 24 Jul 2021 19:52:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3825580066D
	for <cluster-devel@redhat.com>; Sat, 24 Jul 2021 19:52:55 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
	[209.85.208.176]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-300-Nm-8cdYZPMyLiuSgxIbpxQ-1; Sat, 24 Jul 2021 15:52:53 -0400
X-MC-Unique: Nm-8cdYZPMyLiuSgxIbpxQ-1
Received: by mail-lj1-f176.google.com with SMTP id l17so6125463ljn.2
	for <cluster-devel@redhat.com>; Sat, 24 Jul 2021 12:52:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=lpee2uSXjqYzurXDPtFtjsJbLcrcS7+O9pSXA980Af4=;
	b=lqt99hmDiMqPBoV+vr9dOfj7K6Op+aOHBbghx0YGBx3ZOd/F+EOic4pwpEWXymTbul
	OUJj3IzOjhvCZHLONIz3PPeGaWwCCar/cDPQGJHXYZ8azdj5N09DLz12ywWeoLUgSKvr
	0s92r7+8IGntuestYA0B5RpFL0rZT3rmFqQRFTWnfdJ2eDnlGzUZcW46A/SYyJzRUZT9
	Nd6XyKGvwaDbuiRzdU0E/xGMT+I0o/or5Mk07zkdlG6Qbas9bACLS69lRbUHLCT/6cq6
	UoGlfmfYPin+vuIHu3zVqmozVyRXLxdJmRyROF1AHpPKAEZOVj5KhbUbViBkxf4mxkXV
	hVzg==
X-Gm-Message-State: AOAM530SVefhBlqTPLy0fYVv0tBU4K043rpfTrUnMThcInQ6TFgPtSB6
	MbG/Aich/cq4+VET1xR1B75yBYXCFRIvEmE5
X-Google-Smtp-Source: ABdhPJxqod2TpVIB6oXetzQBhbm1Ok56L3OIvP3W4mOXysX4vRnZ2QVebtKiPRV24Pf+6I7o2G5aAQ==
X-Received: by 2002:a2e:9c14:: with SMTP id s20mr6861098lji.393.1627156371085; 
	Sat, 24 Jul 2021 12:52:51 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com.
	[209.85.167.46]) by smtp.gmail.com with ESMTPSA id
	bp40sm2520647lfb.221.2021.07.24.12.52.50
	for <cluster-devel@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sat, 24 Jul 2021 12:52:50 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id r26so8001224lfp.5
	for <cluster-devel@redhat.com>; Sat, 24 Jul 2021 12:52:50 -0700 (PDT)
X-Received: by 2002:a05:6512:3f82:: with SMTP id
	x2mr7023206lfa.421.1627156370007; 
	Sat, 24 Jul 2021 12:52:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210724193449.361667-1-agruenba@redhat.com>
	<20210724193449.361667-2-agruenba@redhat.com>
In-Reply-To: <20210724193449.361667-2-agruenba@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 24 Jul 2021 12:52:34 -0700
X-Gmail-Original-Message-ID: <CAHk-=whodi=ZPhoJy_a47VD+-aFtz385B4_GHvQp8Bp9NdTKUg@mail.gmail.com>
Message-ID: <CAHk-=whodi=ZPhoJy_a47VD+-aFtz385B4_GHvQp8Bp9NdTKUg@mail.gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>, Jan Kara <jack@suse.cz>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v4 1/8] iov_iter: Introduce
	iov_iter_fault_in_writeable helper
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Sat, Jul 24, 2021 at 12:35 PM Andreas Gruenbacher
<agruenba@redhat.com> wrote:
>
> +int iov_iter_fault_in_writeable(const struct iov_iter *i, size_t bytes)
> +{
...
> +                       if (fault_in_user_pages(start, len, true) != len)
> +                               return -EFAULT;

Looking at this once more, I think this is likely wrong.

Why?

Because any user can/should only care about at least *part* of the
area being writable.

Imagine that you're doing a large read. If the *first* page is
writable, you should still return the partial read, not -EFAULT.

So I think the code needs to return 0 if _any_ fault was successful.
Or perhaps return how much it was able to fault in. Because returning
-EFAULT if any of it failed seems wrong, and doesn't allow for partial
success being reported.

The other reaction I have is that you now only do the
iov_iter_fault_in_writeable, but then you make fault_in_user_pages()
still have that "bool write" argument.

We already have 'fault_in_pages_readable()', and that one is more
efficient (well, at least if the fault isn't needed it is). So it
would make more sense to just implement fault_in_pages_writable()
instead of that "fault_in_user_pages(, bool write)".

                 Linus

