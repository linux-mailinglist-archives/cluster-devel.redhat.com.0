Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9741A39690A
	for <lists+cluster-devel@lfdr.de>; Mon, 31 May 2021 22:35:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1622493337;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=HEDkrbqvNW0hJsL8uIOmjinWERML/wUgza3RlvXnVCA=;
	b=EyXJkrG1BvGJDIXB6QklHccz2A3u3em9/uFfKl63MEisjGIhnOse0BuLbB0Hcg4cEwBqfY
	pMcNm3H6BwehIgmw0xiLIRTBbyAF9alvTl+iGo2iw+j120bE8pvsVU92zZUgkNogY5A76l
	VOr4X6C2hsl60alWxyC3X3GXnUBHR70=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-534-KrZhwZ8CMVSrtZ_nJiSj_w-1; Mon, 31 May 2021 16:35:36 -0400
X-MC-Unique: KrZhwZ8CMVSrtZ_nJiSj_w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 88108180FD6A;
	Mon, 31 May 2021 20:35:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 759C5100763C;
	Mon, 31 May 2021 20:35:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4FC0E1801029;
	Mon, 31 May 2021 20:35:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14VKZVOY032511 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 31 May 2021 16:35:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 66D79200A4E6; Mon, 31 May 2021 20:35:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 62220200A6E8
	for <cluster-devel@redhat.com>; Mon, 31 May 2021 20:35:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 227C380D0E0
	for <cluster-devel@redhat.com>; Mon, 31 May 2021 20:35:25 +0000 (UTC)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
	[209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-537-UkPRDhrcPouIMp2bjIisnA-1; Mon, 31 May 2021 16:35:23 -0400
X-MC-Unique: UkPRDhrcPouIMp2bjIisnA-1
Received: by mail-wm1-f69.google.com with SMTP id
	g9-20020a05600c4ec9b0290198e2707cecso363108wmq.3
	for <cluster-devel@redhat.com>; Mon, 31 May 2021 13:35:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=AZZGvag4gS3LveutNw9GWNhlWMDrqfgm2Lt6HFJ2ifE=;
	b=KOd1Bj2ByPBOX2FqOqPuULUdyoZC2Qno6PftqXsCNgdDw5sFWQHBORxr4A4IDaImj4
	PGlZ20EemR8PUEsbwEvt1gjcky/S4IcFnrXYEPnQARd0FXhYv1KgVilAsu+uOtmMWB1U
	vH81zsLQ0U4xc0l5nE5j1Q/FUM3uf6shM0VouBCD1AyFagjGUgiWILgDwiLYsho+gw4E
	QXjM2x9/QoUODTEwktV3JlPS/w0ZTkH5HkUVl1OSo/COu99XWfEhiTbHS8Vnn3sYYVgj
	g0amPBEeYE/Ne3CJ3wuu7SBEkrSseKgh2Cnad7a5459VXDL4r6eAoETe3QaCffxdoG+w
	Y/zg==
X-Gm-Message-State: AOAM530GJ85M4PDxW9rEA5oK0HeqRfQ5M2hjGmFHSuEObTkfIzENp1SN
	8pf+YOyvue6L9w8s0LD/5+NXaFkscEdbKb1sGYaWg10Psi0mdlhdH0uHCkpLMle/8bw35sx58Qt
	yrB84e4jV0Q/5uGUQyqY5xNnGhlRIPWWzQIY5SQ==
X-Received: by 2002:adf:fe4f:: with SMTP id m15mr5958373wrs.361.1622493322231; 
	Mon, 31 May 2021 13:35:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCghc6o0pHYKdMW3nD81TNnCov9ASkx9dFfoB7DriNbRzdAlHameaORzL/Q2J5uPQXvJ6Z+rUz1LzzJR3X8/U=
X-Received: by 2002:adf:fe4f:: with SMTP id m15mr5958359wrs.361.1622493322041; 
	Mon, 31 May 2021 13:35:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210531170123.243771-1-agruenba@redhat.com>
	<CAHk-=wgX=fZ+y=SxBsod8CvZmZ0-X7vZ6dV6EgLPkpBXbt=nQQ@mail.gmail.com>
In-Reply-To: <CAHk-=wgX=fZ+y=SxBsod8CvZmZ0-X7vZ6dV6EgLPkpBXbt=nQQ@mail.gmail.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 31 May 2021 22:35:11 +0200
Message-ID: <CAHc6FU6uQsJaqxTzKMzR8j4a=T0R05LZCEv8-w-AP0gWyantNw@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 14VKZVOY032511
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>, Jan Kara <jack@suse.cz>,
	Al Viro <viro@zeniv.linux.org.uk>, Matthew Wilcox <willy@infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [Cluster-devel] [RFC 0/9] gfs2: handle page faults during read
	and write
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
Content-Transfer-Encoding: 8bit

On Mon, May 31, 2021 at 7:57 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> Sorry, I'm on a boat right now, with only a cellphone. Which is why this html mess email, and quick reply.
>
> Due to the html, this may get a bounce from the mailing list, and only make it to the personal email recipients. Feel free to quote more just in case others didn't get my original email through the lists.
>
> I'll be out most of the day, but I'll try to take a deeper look this evening.
>
> I'm the meantime, a couple of questions and comments..
>
> On Mon, May 31, 2021, 07:01 Andreas Gruenbacher <agruenba@redhat.com> wrote:
>>
>> here's a set of fixes for how gfs2 handles page faults during read and
>> write syscalls.
>
> So how much of this is due to the confusion you just introduced where you pointlessly and incorrectly take an exclusive luck for write faults?
>
> See my reply to that pull request for why it's wrong and pointless.

Those are separate problems. If we treat a write fault as a filesystem
read and only take a read lock as you've explained in your other
reply, we'll still have some remaining locking mode incompatibilities
(gfs2_holder_is_compatible); we probably won't need
iov_iter_fault_in_writeable() though.

>>   The patch queue is ready for merging except for two
>> open issues.
>
>
> There is no way this series is acceptable for 5.13. This kind of change is very much a merge window thing. Much much too late to make fundamental locking changes. Maybe it can then be backported to stable (including at that point 5.13 of course) if it's been shown to be ok.
>
> This deadlock is not new, we've very much had the same kind of thing when writing to a file in the generic filemap_write() function, where we take the page lock and then copy from user space. If that copy faults, and needs the same page for the source due to an odd mmap issue (usually malicious), you get a deadlock on the page lock it you aren't careful.

Right, the deadlock isn't new, we just didn't know about it until Jan
Kara pointed it out.

It would be important to us to have the self-recursion case addressed
in 5.13 at least; that's the four patches up to and including "gfs2:
Fix mmap + page fault deadlocks (part 1)".

> I'm surprised that gfs2 hasn't seen this, I thought we had fstests for it. And I'd have expected that case to also trigger any internal gfs2 issues, although it's possible that the generic code just does such a good job at avoiding the issue that we'd need another test for your case.

fstests didn't catch it, so I wrote a new test (not merged yet):

https://lore.kernel.org/fstests/20210531152604.240462-1-agruenba@redhat.com/

Thanks a lot,
Andreas


