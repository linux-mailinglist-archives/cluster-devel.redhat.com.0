Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id E46A93FA6EB
	for <lists+cluster-devel@lfdr.de>; Sat, 28 Aug 2021 19:14:01 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-vXR_Puf5PXeWXVTMtt5T5w-1; Sat, 28 Aug 2021 13:13:54 -0400
X-MC-Unique: vXR_Puf5PXeWXVTMtt5T5w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D086C185302D;
	Sat, 28 Aug 2021 17:13:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F89F100EBAD;
	Sat, 28 Aug 2021 17:13:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 92F3B1819AC9;
	Sat, 28 Aug 2021 17:13:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17SHDagj017499 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 28 Aug 2021 13:13:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D69302166B25; Sat, 28 Aug 2021 17:13:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D15EB2166B40
	for <cluster-devel@redhat.com>; Sat, 28 Aug 2021 17:13:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 053E98007B1
	for <cluster-devel@redhat.com>; Sat, 28 Aug 2021 17:13:34 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
	[209.85.167.41]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-15-VBIcX2b7M5CwQ1C9IHUs-w-1; Sat, 28 Aug 2021 13:13:31 -0400
X-MC-Unique: VBIcX2b7M5CwQ1C9IHUs-w-1
Received: by mail-lf1-f41.google.com with SMTP id l2so13356771lfp.2
	for <cluster-devel@redhat.com>; Sat, 28 Aug 2021 10:13:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=PG8z+XIonuWGdu3czEMXRzaWItNuzacbk0dZJgvuswY=;
	b=e617JEIAXz5IGW9TfblqrUyJCnuzpY+foB13BP8m4AYAgLUjQ8f0tEm/260+QrUHd+
	KPDar/9FGb9CYqnjvWoxpBvwOayhhX+7gA/o7KkOQc4Ygn/+EfbVMfhzHJsmg0ETz9qf
	9D+ZET/47NqpdTLWBh/CSaymSNSnGkiucH/fj+mpxxxsjtYT8BswdLwJtP7pI3MKu04i
	I5NElYy8RBAezBh2Cyxbbi4VVQVg/Ggbw63x8J+fDBz6PcjvL+DyJZ8xfp2GnXxumkvH
	AZNg1brcJSEe/ARKA2Qdd7/mUTy4xoQnMSDU4tIk/6XYR/5crcDJmh7OuhxF7fUin1iQ
	8RGw==
X-Gm-Message-State: AOAM532w49f9ctFPnv5KiezZb7oj3mgbwzZALxMs7NKakrfeg/rcMY+c
	ORzVHuyleWtEL5w9qDbh9juJCkrIYO+CI4pS
X-Google-Smtp-Source: ABdhPJzd+MGZio2Jf8/twutyw8gljZRZZjfkPIdm0/RMpeotc5ETcN1nNUC61ZE19B6vYQau2WyxPw==
X-Received: by 2002:a05:6512:ad5:: with SMTP id
	n21mr11271832lfu.214.1630170809665; 
	Sat, 28 Aug 2021 10:13:29 -0700 (PDT)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com.
	[209.85.208.171]) by smtp.gmail.com with ESMTPSA id
	c24sm1002957lfc.140.2021.08.28.10.13.27
	for <cluster-devel@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sat, 28 Aug 2021 10:13:27 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id m4so17418138ljq.8
	for <cluster-devel@redhat.com>; Sat, 28 Aug 2021 10:13:27 -0700 (PDT)
X-Received: by 2002:a2e:7d0e:: with SMTP id y14mr12752568ljc.251.1630170807239;
	Sat, 28 Aug 2021 10:13:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210827164926.1726765-1-agruenba@redhat.com>
	<20210827164926.1726765-5-agruenba@redhat.com>
	<20210827205644.lkihrypv27er5km3@kari-VirtualBox>
In-Reply-To: <20210827205644.lkihrypv27er5km3@kari-VirtualBox>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 28 Aug 2021 10:13:11 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh-TeAeraYo9jM7FsAVDtfCji_5ao=B3eoO10Sf2SdeTA@mail.gmail.com>
Message-ID: <CAHk-=wh-TeAeraYo9jM7FsAVDtfCji_5ao=B3eoO10Sf2SdeTA@mail.gmail.com>
To: Kari Argillander <kari.argillander@gmail.com>
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
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	ntfs3@lists.linux.dev, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v7 04/19] iov_iter: Turn
	iov_iter_fault_in_readable into fault_in_iov_iter_readable
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

On Fri, Aug 27, 2021 at 1:56 PM Kari Argillander
<kari.argillander@gmail.com> wrote:
>
> At least this patch will break ntfs3 which is in next. It has been there
> just couple weeks so I understand. I added Konstantin and ntfs3 list so
> that we know what is going on. Can you please info if and when do we
> need rebase.

No need to rebase. It just makes it harder for me to pick one pull
over another, since it would mix the two things together.

I'll notice the semantic conflict as I do my merge build test, and
it's easy for me to fix as part of the merge - whichever one I merge
later.

It's good if both sides remind me about the issue, but these kinds of
conflicts are not a problem.

And yes, it does happen that I miss conflicts like this if I merge
while on the road and don't do my full build tests, or if it's some
architecture-specific thing or a problem that doesn't happen on my
usual allmodconfig testing.  But neither of those cases should be
present in this situation.

                    Linus

