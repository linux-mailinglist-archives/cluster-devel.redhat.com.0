Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E478A789201
	for <lists+cluster-devel@lfdr.de>; Sat, 26 Aug 2023 00:53:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693004021;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=pUz0mvDJOC9uQjgg5Uba361PK/6ticcfnjAOo3qTtYA=;
	b=hqXhwP/dYaTpk8bulLrbiNmJxM11MrsQVPy0AmyoDBRHbb31R8LnHZG1UXtq3RbDKPvIpD
	pMGTaVRPs9Lz/OSSyHGTLCQrZV0xYgE0eaU1z7wMZuO96qtgsam8iJjWeB6c3t/0t9uR4T
	IDrjVmeeG1o8qfdyeR1DSbT3SkuMNyU=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-ulILvY94O0eWH0UYdnsjmg-1; Fri, 25 Aug 2023 18:53:39 -0400
X-MC-Unique: ulILvY94O0eWH0UYdnsjmg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BCAFD1C05149;
	Fri, 25 Aug 2023 22:53:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 77BD89A;
	Fri, 25 Aug 2023 22:53:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E9F0119465B1;
	Fri, 25 Aug 2023 22:53:36 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7DA8D19465A8 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 25 Aug 2023 22:53:35 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 56F1B2166B27; Fri, 25 Aug 2023 22:53:35 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E0482166B26
 for <cluster-devel@redhat.com>; Fri, 25 Aug 2023 22:53:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F7D13C0C48D
 for <cluster-devel@redhat.com>; Fri, 25 Aug 2023 22:53:35 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-308-olJ8zC6zMCWGHkvJnQXA3w-1; Fri, 25 Aug 2023 18:53:33 -0400
X-MC-Unique: olJ8zC6zMCWGHkvJnQXA3w-1
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-68a42d06d02so1178156b3a.0
 for <cluster-devel@redhat.com>; Fri, 25 Aug 2023 15:53:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693004012; x=1693608812;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pUz0mvDJOC9uQjgg5Uba361PK/6ticcfnjAOo3qTtYA=;
 b=Erox4p/fM8Xc2chSaH9Oqv7dhrdmYRofzjx2a5aumzQPqNbeKfo5tE/c+f3k/uMEL6
 MwmEYD/+H6UsRx+Ctf4iJnb+e55FyVxEMOM/6ocMDCe5HWVDJzkVji6YRSPS2rhWakB8
 6ceBcW9DYgkmNYNuXnQO4+MwjdLUVmMQUE0CfED2qbi0ULFt0QKb82yhYbZAqI4oWycr
 Q4AInHP+y9B7DXOZoRIR7OQis43HKINap//a9scjqaFI7UMs0hf+zC8cUS5lYLw4jpEn
 KPQLZBMyl6j8zzPiGg1z/BwSs8vinLhsuquJlpHgsQlZ87R/ZleWgEAZ+3jKCXvO+xSX
 FxSg==
X-Gm-Message-State: AOJu0YzYoOSV35DGdO3DLgzMmkZ1z1gyMquajKkLRV/l7x8NVGi0Hcnn
 FZW1DzfNFBg4B1cP6qPQdXFzEA==
X-Google-Smtp-Source: AGHT+IF7qLruqklxY40yAH4SKvsJCnFBTQ8pg1x9p8DXB9ryPTSvbA4aGhPPBTQdBXYgxxyeFGZdhA==
X-Received: by 2002:a05:6a20:7354:b0:13d:5b8e:db83 with SMTP id
 v20-20020a056a20735400b0013d5b8edb83mr20399311pzc.9.1693004012072; 
 Fri, 25 Aug 2023 15:53:32 -0700 (PDT)
Received: from dread.disaster.area (pa49-195-66-88.pa.nsw.optusnet.com.au.
 [49.195.66.88]) by smtp.gmail.com with ESMTPSA id
 u15-20020a62ed0f000000b006887be16675sm2060364pfh.205.2023.08.25.15.53.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Aug 2023 15:53:31 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
 (envelope-from <david@fromorbit.com>) id 1qZfgG-006WDY-1c;
 Sat, 26 Aug 2023 08:53:28 +1000
Date: Sat, 26 Aug 2023 08:53:28 +1000
From: Dave Chinner <david@fromorbit.com>
To: Hao Xu <hao.xu@linux.dev>
Message-ID: <ZOkw6KkdP1UWPNBW@dread.disaster.area>
References: <20230825135431.1317785-1-hao.xu@linux.dev>
MIME-Version: 1.0
In-Reply-To: <20230825135431.1317785-1-hao.xu@linux.dev>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: Re: [Cluster-devel] [PATCH RFC v5 00/29] io_uring getdents
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: Wanpeng Li <wanpengli@tencent.com>, "Darrick J . Wong" <djwong@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Stefan Roesch <shr@fb.com>, Clay Harris <bugs@claycon.org>,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 codalist@coda.cs.cmu.edu, cluster-devel@redhat.com, linux-cachefs@redhat.com,
 linux-ext4@vger.kernel.org, devel@lists.orangefs.org,
 linux-cifs@vger.kernel.org, ecryptfs@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-block@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, io-uring@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 netdev@vger.kernel.org, samba-technical@lists.samba.org,
 linux-unionfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, bpf@vger.kernel.org,
 Pavel Begunkov <asml.silence@gmail.com>, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: fromorbit.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 25, 2023 at 09:54:02PM +0800, Hao Xu wrote:
> From: Hao Xu <howeyxu@tencent.com>
> 
> This series introduce getdents64 to io_uring, the code logic is similar
> with the snychronized version's. It first try nowait issue, and offload
> it to io-wq threads if the first try fails.
> 
> Patch1 and Patch2 are some preparation
> Patch3 supports nowait for xfs getdents code
> Patch4-11 are vfs change, include adding helpers and trylock for locks
> Patch12-29 supports nowait for involved xfs journal stuff
> note, Patch24 and 27 are actually two questions, might be removed later.
> an xfs test may come later.

You need to drop all the XFS journal stuff. It's fundamentally
broken as it stands, and we cannot support non-blocking
transactional changes without first putting a massive investment in
transaction and intent chain rollback to allow correctly undoing
partially complete modifications.

Regardless, non-blocking transactions are completely unnecessary for
a non-blocking readdir implementation. readdir should only be
touching atime, and with relatime it should only occur once every 24
hours per inode. If that's a problem, then we have noatime mount
options. Hence I just don't see any point in worrying about having a
timestamp update block occasionally...

I also don't really don't see why you need to fiddle with xfs buffer
cache semantics - it already has the functionality "nowait" buffer
reads require (i.e.  XBF_INCORE|XBF_TRYLOCK).

However, the readahead IO that the xfs readdir code issues cannot
use your defined NOWAIT semantics - it must be able to allocate
memory and issue IO. Readahead already avoids blocking on memory
allocation and blocking on IO via the XBF_READ_AHEAD flag. This sets
__GFP_NORETRY for buffer allocation and REQ_RAHEAD for IO. Hence
readahead only needs the existing XBF_TRYLOCK flag to be set to be
compatible with the required NOWAIT semantics....

As for the NOIO memory allocation restrictions io_uring requires,
that should be enforced at the io_uring layer before calling into
the VFS using memalloc_noio_save/restore.  At that point no memory
allocation will trigger IO and none of the code running under NOWAIT
conditions even needs to be aware that io_uring has a GFP_NOIO
restriction on memory allocation....

Please go back to the simple "do non-blocking buffer IO"
implementation we started with and don't try to solve every little
blocking problem that might exist in the VFS and filesystems...

-Dave
-- 
Dave Chinner
david@fromorbit.com

