Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8029843B9FA
	for <lists+cluster-devel@lfdr.de>; Tue, 26 Oct 2021 20:50:42 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-DvDunGaMNGmD7Xw--yiArA-1; Tue, 26 Oct 2021 14:50:38 -0400
X-MC-Unique: DvDunGaMNGmD7Xw--yiArA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 808391891024;
	Tue, 26 Oct 2021 18:50:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B43D6A904;
	Tue, 26 Oct 2021 18:50:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 904681809C81;
	Tue, 26 Oct 2021 18:50:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19QIoU6Q021890 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 26 Oct 2021 14:50:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F0AF451E3; Tue, 26 Oct 2021 18:50:29 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E94B751E1
	for <cluster-devel@redhat.com>; Tue, 26 Oct 2021 18:50:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D5E688007B1
	for <cluster-devel@redhat.com>; Tue, 26 Oct 2021 18:50:25 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
	[209.85.167.42]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-441-20DPS-1WM3WJUBYlAwRYMQ-1; Tue, 26 Oct 2021 14:50:24 -0400
X-MC-Unique: 20DPS-1WM3WJUBYlAwRYMQ-1
Received: by mail-lf1-f42.google.com with SMTP id bp15so861609lfb.4
	for <cluster-devel@redhat.com>; Tue, 26 Oct 2021 11:50:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=r5Cx2RnmHPH+SxoKka0sJEz3NkssP3YCqbiSsqzadkQ=;
	b=I1ixqouiiQwHJ2+SFlM7SJ+biKDcNXBN17ZSc9+Dsv6wQmHXno3pBKX7bsT50RtBd+
	0IPFC7yTunLSGvZhkw8ppfLe7xqXPUKTMhUaTh1mZd4JfekpvKZxC6oGbgAhWGAV8rPC
	prL6MmK+p8E8RTBsobU/xo8LS/RHVJDuAFzK72MbrJxIdBBNx6MS0bURSzq9XpYc9+V+
	sJgNL+2iK3xazOOpEI1S/mLPXJlCRW1mD6bmojpUQ3hChMjH9QF0sz5xu5jVnOS4pg6k
	uaZn1TcyfzPxHGUupojl42E05FaF6x6ZdiWAOWyzZErWsYjDI++S6gLRGd/zNTvB8zYU
	+Sew==
X-Gm-Message-State: AOAM531Ns2DfbiURqN8ha0/6ZhJ02qGEJcnUrkmyQow2eQXNEr0XH97D
	p4v/K5ykPC7H/+NsN0C3nCGbflmVBOXnsAgi
X-Google-Smtp-Source: ABdhPJwP1d8M4FiKhEbBACo2aOI+qOOhbdDnXb27emc0yTFc7Y04kvFmcTlDJ0GItM9OgiMsbKN8eQ==
X-Received: by 2002:a05:6512:21a9:: with SMTP id
	c9mr630183lft.565.1635274222250; 
	Tue, 26 Oct 2021 11:50:22 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com.
	[209.85.208.180]) by smtp.gmail.com with ESMTPSA id
	z23sm206580lfu.119.2021.10.26.11.50.21 for <cluster-devel@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 26 Oct 2021 11:50:21 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id o26so506531ljj.2
	for <cluster-devel@redhat.com>; Tue, 26 Oct 2021 11:50:21 -0700 (PDT)
X-Received: by 2002:a2e:9e13:: with SMTP id e19mr4519488ljk.494.1635274221013; 
	Tue, 26 Oct 2021 11:50:21 -0700 (PDT)
MIME-Version: 1.0
References: <20211019134204.3382645-1-agruenba@redhat.com>
	<CAHk-=wh0_3y5s7-G74U0Pcjm7Y_yHB608NYrQSvgogVNBxsWSQ@mail.gmail.com>
	<YXBFqD9WVuU8awIv@arm.com>
	<CAHk-=wgv=KPZBJGnx_O5-7hhST8CL9BN4wJwtVuycjhv_1MmvQ@mail.gmail.com>
	<YXCbv5gdfEEtAYo8@arm.com>
	<CAHk-=wgP058PNY8eoWW=5uRMox-PuesDMrLsrCWPS+xXhzbQxQ@mail.gmail.com>
	<YXL9tRher7QVmq6N@arm.com>
	<CAHk-=wg4t2t1AaBDyMfOVhCCOiLLjCB5TFVgZcV4Pr8X2qptJw@mail.gmail.com>
	<CAHc6FU7BEfBJCpm8wC3P+8GTBcXxzDWcp6wAcgzQtuaJLHrqZA@mail.gmail.com>
	<YXhH0sBSyTyz5Eh2@arm.com>
In-Reply-To: <YXhH0sBSyTyz5Eh2@arm.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 26 Oct 2021 11:50:04 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjWDsB-dDj+x4yr8h8f_VSkyB7MbgGqBzDRMNz125sZxw@mail.gmail.com>
Message-ID: <CAHk-=wjWDsB-dDj+x4yr8h8f_VSkyB7MbgGqBzDRMNz125sZxw@mail.gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>
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
Cc: kvm-ppc@vger.kernel.org, cluster-devel <cluster-devel@redhat.com>,
	Jan Kara <jack@suse.cz>, "Darrick J. Wong" <djwong@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>, Paul Mackerras <paulus@ozlabs.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	linux-btrfs <linux-btrfs@vger.kernel.org>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v8 00/17] gfs2: Fix mmap + page fault
	deadlocks
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

On Tue, Oct 26, 2021 at 11:24 AM Catalin Marinas
<catalin.marinas@arm.com> wrote:
>
> While more intrusive, I'd rather change copy_page_from_iter_atomic()
> etc. to take a pointer where to write back an error code.

I absolutely hate this model.

The thing is, going down that rat-hole, you'll find that you'll need
to add it to *all* the "copy_to/from_user()" cases, which isn't
acceptable. So then you start doing some duplicate versions with
different calling conventions, just because of things like this.

So no, I really don't want a "pass down a reference to an extra error
code" kind of horror.

That said, the fact that these sub-page faults are always
non-recoverable might be a hint to a solution to the problem: maybe we
could extend the existing return code with actual negative error
numbers.

Because for _most_ cases of "copy_to/from_user()" and friends by far,
the only thing we look for is "zero for success".

We could extend the "number of bytes _not_ copied" semantics to say
"negative means fatal", and because there are fairly few places that
actually look at non-zero values, we could have a coccinelle script
that actually marks those places.

End result: no change in calling conventions, no change to most users,
and the (relatively few) cases where we look at the "what about
partial results", we just add a

         .. existing code ..
         ret = copy_from_user(..);
+        if (ret < 0)
+                break;  // or whatever "fatal error" situation
         .. existing  code ..

kind of thing that just stops the re-try.

(The coccinelle script couldn't actually do that, but it could add
some comment marker or something so that it's easy to find and then
manually fix up the places it finds).

             Linus

