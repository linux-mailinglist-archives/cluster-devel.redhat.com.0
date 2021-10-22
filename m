Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 28508437000
	for <lists+cluster-devel@lfdr.de>; Fri, 22 Oct 2021 04:31:37 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-461-EuZSfun1Pf2UIfiZ34XQvQ-1; Thu, 21 Oct 2021 22:31:33 -0400
X-MC-Unique: EuZSfun1Pf2UIfiZ34XQvQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C5502BC290;
	Fri, 22 Oct 2021 02:31:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B51A919D9D;
	Fri, 22 Oct 2021 02:31:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 76DD24A703;
	Fri, 22 Oct 2021 02:31:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19M2UuKV027125 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 21 Oct 2021 22:30:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EA37D2026D60; Fri, 22 Oct 2021 02:30:55 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E42BC2026D46
	for <cluster-devel@redhat.com>; Fri, 22 Oct 2021 02:30:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 120178007B1
	for <cluster-devel@redhat.com>; Fri, 22 Oct 2021 02:30:53 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
	[209.85.167.48]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-24--WRk1vUINyWjUdb4VnLqfQ-1; Thu, 21 Oct 2021 22:30:51 -0400
X-MC-Unique: -WRk1vUINyWjUdb4VnLqfQ-1
Received: by mail-lf1-f48.google.com with SMTP id x27so544240lfu.5
	for <cluster-devel@redhat.com>; Thu, 21 Oct 2021 19:30:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=cbgzVLDCT8DipeBdsMkDowoxxylwz2da/ifUpbOh8z0=;
	b=cG6ixiDnpBJ7uUnc6nLWcQ4hMPTCR0DN5kULox6yMOtJI40VO9osYSlmpOTLEDXtCV
	Z3ZRJQMVKxpG0hZxgY76z3TJGEjuUNRI6fIE3NH02V3kZ8R2bLvBAN6v6AY8xePeeqZN
	mF8isyqxjvf3MYBzVZfNXOL1Wx6yVlxlU0c4BPp3oWOQCymCGUCNBOBaxFqM6nnFVh16
	FBqQ8ZouQcdvhRtTLe6TZm01UL8CQqjWxD4KJfHHvQQQTMITmhIb7n0faEgcL87RdGzi
	OYDXOLenB9ZrSKFsRjspALq+DbVr3WRhiLR6UlDVtgSx8TPwXAXu41zduOj0A3YE+7KC
	5x0Q==
X-Gm-Message-State: AOAM530NGxqJbqFRhUGF2U9hCTjCDPH7UUex76tKPekzeXutSl9STKOv
	axErecjnfKXq9FoETGLlktpAzo7NJsK2U8mD
X-Google-Smtp-Source: ABdhPJx/KxuOimml162yh/2hlOhOVAvoB1AUd5sOoS5B+RIaQqEL3c/bOph81MlYoOf2n92nIVWfZA==
X-Received: by 2002:a05:6512:ac9:: with SMTP id
	n9mr8553633lfu.247.1634869849168; 
	Thu, 21 Oct 2021 19:30:49 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com.
	[209.85.208.181]) by smtp.gmail.com with ESMTPSA id
	x20sm598748lfu.196.2021.10.21.19.30.47 for <cluster-devel@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 21 Oct 2021 19:30:47 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id o26so2003631ljj.2
	for <cluster-devel@redhat.com>; Thu, 21 Oct 2021 19:30:47 -0700 (PDT)
X-Received: by 2002:a2e:a407:: with SMTP id p7mr10376944ljn.68.1634869846779; 
	Thu, 21 Oct 2021 19:30:46 -0700 (PDT)
MIME-Version: 1.0
References: <YSk+9cTMYi2+BFW7@zeniv-ca.linux.org.uk>
	<YSldx9uhMYhT/G8X@zeniv-ca.linux.org.uk>
	<YSqOUb7yZ7kBoKRY@zeniv-ca.linux.org.uk> <YS40qqmXL7CMFLGq@arm.com>
	<YS5KudP4DBwlbPEp@zeniv-ca.linux.org.uk> <YWR2cPKeDrc0uHTK@arm.com>
	<CAHk-=wjvQWj7mvdrgTedUW50c2fkdn6Hzxtsk-=ckkMrFoTXjQ@mail.gmail.com>
	<YWSnvq58jDsDuIik@arm.com>
	<CAHk-=wiNWOY5QW5ZJukt_9pHTWvrJhE2=DxPpEtFHAWdzOPDTg@mail.gmail.com>
	<CAHc6FU7bpjAxP+4dfE-C0pzzQJN1p=C2j3vyXwUwf7fF9JF72w@mail.gmail.com>
	<YXE7fhDkqJbfDk6e@arm.com>
	<CAHc6FU5xTMOxuiEDyc9VO_V98=bvoDc-0OFi4jsGPgWJWjRJWQ@mail.gmail.com>
In-Reply-To: <CAHc6FU5xTMOxuiEDyc9VO_V98=bvoDc-0OFi4jsGPgWJWjRJWQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 21 Oct 2021 16:30:30 -1000
X-Gmail-Original-Message-ID: <CAHk-=wgvnU2PXFMpsNErdwE=tXGymLHe275jWkBhCbGiixWU5g@mail.gmail.com>
Message-ID: <CAHk-=wgvnU2PXFMpsNErdwE=tXGymLHe275jWkBhCbGiixWU5g@mail.gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
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
Cc: cluster-devel <cluster-devel@redhat.com>, Jan Kara <jack@suse.cz>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>, Josef Bacik <josef@toxicpanda.com>,
	Al Viro <viro@zeniv.linux.org.uk>, "Darrick J. Wong" <djwong@kernel.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Will Deacon <will@kernel.org>,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 21, 2021 at 4:42 AM Andreas Gruenbacher <agruenba@redhat.com> wrote:
>
> But probing the entire memory range in fault domain granularity in the
> page fault-in functions still doesn't actually make sense. Those
> functions really only need to guarantee that we'll be able to make
> progress eventually. From that point of view, it should be enough to
> probe the first byte of the requested memory range

That's probably fine.

Although it should be more than one byte - "copy_from_user()" might do
word-at-a-time optimizations, so you could have an infinite loop of

 (a) copy_from_user() fails because the chunk it tried to get failed partly

 (b) fault_in() probing succeeds, because the beginning part is fine

so I agree that the fault-in code doesn't need to do the whole area,
but it needs to at least do some <N bytes, up to length> thing, to
handle the situation where the copy_to/from_user requires more than a
single byte.

                 Linus

