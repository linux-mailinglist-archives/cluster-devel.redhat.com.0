Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF0378C3A4
	for <lists+cluster-devel@lfdr.de>; Tue, 29 Aug 2023 13:53:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693310035;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=YZxpYOTF14BVcouqFhbahruwZXBLTSy2TCKsEoryGgA=;
	b=QB10NnEpPQm5q29QUkI6vwrUgUM+sboGC1MHQp5dTpjBrceGg1RBIIS5yS0pGkbTdMt7gV
	NG0lhBWLfoD7TY5hyM9Z6iULysfowS1zkTvhPzyRDGg1NKACsK1fvyqVtG+WWzIeR1BPBE
	hz+Uz7rADKg54yO4MwL5P03o5S11Yno=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-583-a6nMBCxTM1qacTOCc25hAA-1; Tue, 29 Aug 2023 07:53:47 -0400
X-MC-Unique: a6nMBCxTM1qacTOCc25hAA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4193D28004E9;
	Tue, 29 Aug 2023 11:53:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BFD1E40C6F4C;
	Tue, 29 Aug 2023 11:53:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 62E5719465BC;
	Tue, 29 Aug 2023 11:53:44 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2539819465B3 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 29 Aug 2023 11:53:43 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 145DF140E963; Tue, 29 Aug 2023 11:53:43 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D168140E950
 for <cluster-devel@redhat.com>; Tue, 29 Aug 2023 11:53:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E62C71C07830
 for <cluster-devel@redhat.com>; Tue, 29 Aug 2023 11:53:42 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-18-rGkQgv1oM4eCbHbdDi7zoA-1; Tue,
 29 Aug 2023 07:53:39 -0400
X-MC-Unique: rGkQgv1oM4eCbHbdDi7zoA-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1qaxHQ-006P4x-1X; Tue, 29 Aug 2023 11:53:08 +0000
Date: Tue, 29 Aug 2023 12:53:07 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Hao Xu <hao.xu@linux.dev>
Message-ID: <ZO3cI+DkotHQo3md@casper.infradead.org>
References: <20230827132835.1373581-1-hao.xu@linux.dev>
 <20230827132835.1373581-8-hao.xu@linux.dev>
 <ZOvA5DJDZN0FRymp@casper.infradead.org>
 <c728bf3f-d9db-4865-8473-058b26c11c06@linux.dev>
MIME-Version: 1.0
In-Reply-To: <c728bf3f-d9db-4865-8473-058b26c11c06@linux.dev>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [Cluster-devel] [PATCH 07/11] vfs: add nowait parameter for
 file_accessed()
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
 Dominique Martinet <asmadeus@codewreck.org>,
 Dave Chinner <david@fromorbit.com>, linux-kernel@vger.kernel.org,
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: infradead.org
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 29, 2023 at 03:46:13PM +0800, Hao Xu wrote:
> On 8/28/23 05:32, Matthew Wilcox wrote:
> > On Sun, Aug 27, 2023 at 09:28:31PM +0800, Hao Xu wrote:
> > > From: Hao Xu <howeyxu@tencent.com>
> > > 
> > > Add a boolean parameter for file_accessed() to support nowait semantics.
> > > Currently it is true only with io_uring as its initial caller.
> > 
> > So why do we need to do this as part of this series?  Apparently it
> > hasn't caused any problems for filemap_read().
> > 
> 
> We need this parameter to indicate if nowait semantics should be enforced in
> touch_atime(), There are locks and maybe IOs in it.

That's not my point.  We currently call file_accessed() and
touch_atime() for nowait reads and nowait writes.  You haven't done
anything to fix those.

I suspect you can trim this patchset down significantly by avoiding
fixing the file_accessed() problem.  And then come back with a later
patchset that fixes it for all nowait i/o.  Or do a separate prep series
first that fixes it for the existing nowait users, and then a second
series to do all the directory stuff.

I'd do the first thing.  Just ignore the problem.  Directory atime
updates cause I/O so rarely that you can afford to ignore it.  Almost
everyone uses relatime or nodiratime.

