Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id C98241D622C
	for <lists+cluster-devel@lfdr.de>; Sat, 16 May 2020 17:37:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589643438;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=TG5YZgmRlXVS7HvhJz7DOFxKZzjqL5DT1HxTsi4ato4=;
	b=YxOa5Xf5k0qgWrHIernGCYimpAZHCS0etLkmt86pnKNlwiLkoJNEbdlLSDhOM/UIlQXzSh
	iMWqQL+A8MNKYawSGsaLAGrou+suAvX67Wu0aIJQVuWp4uat+gG7Dazts3axqXL6d/myB3
	uV7TcSJCXPVKXUFybPr9ZQ3o3QKbgik=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-7MBuzEwnPBeg-uc5CagZcg-1; Sat, 16 May 2020 11:37:17 -0400
X-MC-Unique: 7MBuzEwnPBeg-uc5CagZcg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8EDC6107ACCA;
	Sat, 16 May 2020 15:37:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 30F1810021B3;
	Sat, 16 May 2020 15:37:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6ABED4E9E5;
	Sat, 16 May 2020 15:37:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04GFb8Il017889 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 16 May 2020 11:37:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8F6306379E; Sat, 16 May 2020 15:37:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 822BE637A8
	for <cluster-devel@redhat.com>; Sat, 16 May 2020 15:37:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 83532811E77
	for <cluster-devel@redhat.com>; Sat, 16 May 2020 15:37:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-401-knqM_5_FN1KicCeeXui_TA-1; Sat, 16 May 2020 11:37:04 -0400
X-MC-Unique: knqM_5_FN1KicCeeXui_TA-1
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1jZyrs-000842-U1; Sat, 16 May 2020 15:36:52 +0000
Date: Sat, 16 May 2020 08:36:52 -0700
From: Matthew Wilcox <willy@infradead.org>
To: David Laight <David.Laight@aculab.com>
Message-ID: <20200516153652.GM16070@bombadil.infradead.org>
References: <20200514062820.GC8564@lst.de>
	<20200513062649.2100053-1-hch@lst.de>
	<20200513062649.2100053-28-hch@lst.de>
	<20200513180058.GB2491@localhost.localdomain>
	<129070.1589556002@warthog.procyon.org.uk>
	<05d946ae948946158dbfcbc07939b799@AcuMS.aculab.com>
MIME-Version: 1.0
In-Reply-To: <05d946ae948946158dbfcbc07939b799@AcuMS.aculab.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	'David Howells' <dhowells@redhat.com>,
	"linux-sctp@vger.kernel.org" <linux-sctp@vger.kernel.org>,
	"target-devel@vger.kernel.org" <target-devel@vger.kernel.org>,
	"linux-afs@lists.infradead.org" <linux-afs@lists.infradead.org>,
	"linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
	"rds-devel@oss.oracle.com" <rds-devel@oss.oracle.com>,
	"linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	"cluster-devel@redhat.com" <cluster-devel@redhat.com>,
	Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	"drbd-dev@lists.linbit.com" <drbd-dev@tron.linbit.com>,
	"ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
	"linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
	Neil Horman <nhorman@tuxdriver.com>,
	Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	Vlad Yasevich <vyasevich@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Jon Maloy <jmaloy@redhat.com>, Ying Xue <ying.xue@windriver.com>,
	"David S. Miller" <davem@davemloft.net>,
	"ocfs2-devel@oss.oracle.com" <ocfs2-devel@oss.oracle.com>
Subject: Re: [Cluster-devel] [Ocfs2-devel] [PATCH 27/33] sctp: export
	sctp_setsockopt_bindx
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, May 16, 2020 at 03:11:40PM +0000, David Laight wrote:
> From: David Howells
> > Sent: 15 May 2020 16:20
> > Christoph Hellwig <hch@lst.de> wrote:
> > 
> > > > The advantage on using kernel_setsockopt here is that sctp module will
> > > > only be loaded if dlm actually creates a SCTP socket.  With this
> > > > change, sctp will be loaded on setups that may not be actually using
> > > > it. It's a quite big module and might expose the system.
> > >
> > > True.  Not that the intent is to kill kernel space callers of setsockopt,
> > > as I plan to remove the set_fs address space override used for it.
> > 
> > For getsockopt, does it make sense to have the core kernel load optval/optlen
> > into a buffer before calling the protocol driver?  Then the driver need not
> > see the userspace pointer at all.
> > 
> > Similar could be done for setsockopt - allocate a buffer of the size requested
> > by the user inside the kernel and pass it into the driver, then copy the data
> > back afterwards.
> 
> Yes, it also simplifies all the compat code.
> And there is a BPF test in setsockopt that also wants to
> pass on a kernel buffer.
> 
> I'm willing to sit and write the patch.
> Quoting from a post I made later on Friday.
> 
> Basically:
> 
> This patch sequence (to be written) does the following:
> 
> Patch 1: Change __sys_setsockopt() to allocate a kernel buffer,
>          copy the data into it then call set_fs(KERNEL_DS).
>          An on-stack buffer (say 64 bytes) will be used for
>          small transfers.
> 
> Patch 2: The same for __sys_getsockopt().
> 
> Patch 3: Compat setsockopt.
> 
> Patch 4: Compat getsockopt.
> 
> Patch 5: Remove the user copies from the global socket options code.
> 
> Patches 6 to n-1; Remove the user copies from the per-protocol code.
> 
> Patch n: Remove the set_fs(KERNEL_DS) from the entry points.
> 
> This should be bisectable.

I appreciate your dedication to not publishing the source code to
your kernel module, but Christoph's patch series is actually better.
It's typesafe rather than passing void pointers around.

