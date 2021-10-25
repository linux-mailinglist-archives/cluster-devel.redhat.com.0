Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 585B843A1DE
	for <lists+cluster-devel@lfdr.de>; Mon, 25 Oct 2021 21:41:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635190891;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=9aAky+o+A3o8orvEWSZgWo8dAX6pVohf78faelvH+XE=;
	b=g55LkzQhA8rkPtedBMvLAoMaxuAC1get8YpYFh5psbJYgRFBwjISLLAmQO22preHZVgSII
	WOEQtLDOuclfOSV/CyJyPr/CkDQcif/JOWxkE6SiJCid4vvWRdp/RaXmnEFUCSHiCVT6hC
	WfcvY48rSIA6swbUCN8Is1FgsDwsSyo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-yAgQGe-xMJqa_1UQyY9kgw-1; Mon, 25 Oct 2021 15:41:30 -0400
X-MC-Unique: yAgQGe-xMJqa_1UQyY9kgw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F37F210A8E04;
	Mon, 25 Oct 2021 19:41:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CBFD2100238C;
	Mon, 25 Oct 2021 19:41:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 653221801241;
	Mon, 25 Oct 2021 19:41:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19PJba8S004228 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 25 Oct 2021 15:37:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7D24C40C1242; Mon, 25 Oct 2021 19:37:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 79C13400F3EC
	for <cluster-devel@redhat.com>; Mon, 25 Oct 2021 19:37:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 61D3F811E76
	for <cluster-devel@redhat.com>; Mon, 25 Oct 2021 19:37:36 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
	[209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-374-wxgdWws5PQmY752wTrzRAw-1; Mon, 25 Oct 2021 15:37:35 -0400
X-MC-Unique: wxgdWws5PQmY752wTrzRAw-1
Received: by mail-wm1-f72.google.com with SMTP id
	a18-20020a1cf012000000b0032ca3eb2ac3so412032wmb.0
	for <cluster-devel@redhat.com>; Mon, 25 Oct 2021 12:37:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9aAky+o+A3o8orvEWSZgWo8dAX6pVohf78faelvH+XE=;
	b=nwl4JreZN44KErgYrgeyXnmZGVMQB+nrHJMprWlFX3W1GP48JAFSW9U/pLqjPn8lQQ
	1cn1SEwGmtlQxyjf3/f4luZ2CEf8j/tnOhziD/z0LpL8X7g/AgDplduXZo34+0ah/4ly
	Sm1v2UUjpR3AwOBbwphHWT23fZCYHLXJ0m/HM6tURxuHLyBA3Pn9bVBqSh1VOVNx+owP
	9AiV9n042N3T0mpbGOSQ+PvdUyBVlrCujT6Qu5P2m+luW+cRu02MgPEmw4ubI/R7EOVE
	dih0fiTp7zm+udAlO3MsT5Fry9aN8wRWikyA1RRCbwGLVmSdLVayhplkPsc71vx9vWaW
	FnTw==
X-Gm-Message-State: AOAM530guxVamQdl3pkE0y+BWwMIM3q0p3d9+vSAFeqwEdME91nmFRoz
	yNvpZOhM2bS58XyY0doPsAEqwgOJ/zgEXwdKDJ3YczenSDuYnJ7lBsuAmfOow+cinDeab3UQ2kZ
	U3qa7hW/XkODxPN6WgybFtv1gik7fQ1b4P8Rcpw==
X-Received: by 2002:adf:e411:: with SMTP id g17mr24943045wrm.228.1635190653766;
	Mon, 25 Oct 2021 12:37:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4ZUW3Mo472pPGFPqydjyYBJNjFGoCJJfUViSULsVvl27H2hHnmzQ8wgBE36rQvAagQBtIOpD1/zpOLrWd37Q=
X-Received: by 2002:adf:e411:: with SMTP id g17mr24943016wrm.228.1635190653583;
	Mon, 25 Oct 2021 12:37:33 -0700 (PDT)
MIME-Version: 1.0
References: <YS5KudP4DBwlbPEp@zeniv-ca.linux.org.uk> <YWR2cPKeDrc0uHTK@arm.com>
	<CAHk-=wjvQWj7mvdrgTedUW50c2fkdn6Hzxtsk-=ckkMrFoTXjQ@mail.gmail.com>
	<YWSnvq58jDsDuIik@arm.com>
	<CAHk-=wiNWOY5QW5ZJukt_9pHTWvrJhE2=DxPpEtFHAWdzOPDTg@mail.gmail.com>
	<CAHc6FU7bpjAxP+4dfE-C0pzzQJN1p=C2j3vyXwUwf7fF9JF72w@mail.gmail.com>
	<YXE7fhDkqJbfDk6e@arm.com>
	<CAHc6FU5xTMOxuiEDyc9VO_V98=bvoDc-0OFi4jsGPgWJWjRJWQ@mail.gmail.com>
	<YXGexrdprC+NTslm@arm.com>
	<CAHc6FU7im8UzxWCzqUFMKOwyg9zoQ8OZ_M+rRC_E20yE5RNu9g@mail.gmail.com>
	<YXMFw34ZpW+CwlmI@arm.com>
In-Reply-To: <YXMFw34ZpW+CwlmI@arm.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 25 Oct 2021 21:37:22 +0200
Message-ID: <CAHc6FU43-n3tk+vvhXKCX+oyUu4x23-vh8pg18wRgYsB0rt+rA@mail.gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>, Jan Kara <jack@suse.cz>,
	Will Deacon <will@kernel.org>, "Darrick J. Wong" <djwong@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>, Josef Bacik <josef@toxicpanda.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	"ocfs2-devel@oss.oracle.com" <ocfs2-devel@oss.oracle.com>
Subject: Re: [Cluster-devel] [RFC][arm64] possible infinite loop in btrfs
	search_ioctl()
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 22, 2021 at 8:41 PM Catalin Marinas <catalin.marinas@arm.com> wrote:
> On Thu, Oct 21, 2021 at 08:00:50PM +0200, Andreas Gruenbacher wrote:
> > On Thu, Oct 21, 2021 at 7:09 PM Catalin Marinas <catalin.marinas@arm.com> wrote:
> > > This discussion started with the btrfs search_ioctl() where, even if
> > > some bytes were written in copy_to_sk(), it always restarts from an
> > > earlier position, reattempting to write the same bytes. Since
> > > copy_to_sk() doesn't guarantee forward progress even if some bytes are
> > > writable, Linus' suggestion was for fault_in_writable() to probe the
> > > whole range. I consider this overkill since btrfs is the only one that
> > > needs probing every 16 bytes. The other cases like the new
> > > fault_in_safe_writeable() can be fixed by probing the first byte only
> > > followed by gup.
> >
> > Hmm. Direct I/O request sizes are multiples of the underlying device
> > block size, so we'll also get stuck there if fault-in won't give us a
> > full block. This is getting pretty ugly. So scratch that idea; let's
> > stick with probing the whole range.
>
> Ah, I wasn't aware of this. I got lost in the call trees but I noticed
> __iomap_dio_rw() does an iov_iter_revert() only if direction is READ. Is
> this the case for writes as well?

It's the EOF case, so it only applies to reads:

        /*
         * We only report that we've read data up to i_size.
         * Revert iter to a state corresponding to that as some callers (such
         * as the splice code) rely on it.
         */
        if (iov_iter_rw(iter) == READ && iomi.pos >= dio->i_size)
                iov_iter_revert(iter, iomi.pos - dio->i_size);

Andreas

