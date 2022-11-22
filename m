Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 09177633424
	for <lists+cluster-devel@lfdr.de>; Tue, 22 Nov 2022 04:45:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669088722;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=uiFDQ6s5XgAcT9HYz21ROzPo6ZCyN/YsiViP9JuL2Vc=;
	b=Jb5CXEsi1ttlH+yohoXLemxG84UNaZFCjYS93xMHognB/uG6tO8vUeKhhDTwWjE6zIq0LF
	Cdc795otpKGsSTKDulEdjv0Bn+zjcw16JX0TIfSk2nYsmdhSI5c9VlaTiPzxYoVMnLOWRj
	bl+My/oXfifoz7QFK6liIhwYPNZ2KD4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-392-UQcu2x7YP1-AhcCG4vd_fA-1; Mon, 21 Nov 2022 22:45:19 -0500
X-MC-Unique: UQcu2x7YP1-AhcCG4vd_fA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E3130801755;
	Tue, 22 Nov 2022 03:45:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ADB9BC1E890;
	Tue, 22 Nov 2022 03:45:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4D555194658F;
	Tue, 22 Nov 2022 03:45:17 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5E95A1946588 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 22 Nov 2022 03:45:16 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 51AFF4EA4A; Tue, 22 Nov 2022 03:45:16 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A6844EA47
 for <cluster-devel@redhat.com>; Tue, 22 Nov 2022 03:45:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2AC7C811E87
 for <cluster-devel@redhat.com>; Tue, 22 Nov 2022 03:45:16 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-294-p3k0ZawuPeGhz-Ct8DKvcQ-1; Mon,
 21 Nov 2022 22:44:31 -0500
X-MC-Unique: p3k0ZawuPeGhz-Ct8DKvcQ-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1oxKCp-005u2i-VP; Tue, 22 Nov 2022 03:44:20 +0000
Date: Tue, 22 Nov 2022 03:44:19 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Xiubo Li <xiubli@redhat.com>
Message-ID: <Y3xFkyZykWp5/Rvq@casper.infradead.org>
References: <20221120210004.381842-1-jlayton@kernel.org>
 <6627384e-5514-048f-308e-57414d0c5b31@redhat.com>
MIME-Version: 1.0
In-Reply-To: <6627384e-5514-048f-308e-57414d0c5b31@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [Cluster-devel] [PATCH] filelock: move file locking definitions
 to separate header file
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
Cc: Latchesar Ionkov <lucho@ionkov.net>,
 Martin Brandenburg <martin@omnibond.com>,
 "Darrick J. Wong" <djwong@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 David Howells <dhowells@redhat.com>, Joseph Qi <joseph.qi@linux.alibaba.com>,
 Marc Dionne <marc.dionne@auristor.com>, samba-technical@lists.samba.org,
 linux-xfs@vger.kernel.org, hch@lst.de, Mike Marshall <hubcap@omnibond.com>,
 linux-cifs@vger.kernel.org, Miklos Szeredi <miklos@szeredi.hu>,
 Mark Fasheh <mark@fasheh.com>, linux-afs@lists.infradead.org,
 cluster-devel@redhat.com, v9fs-developer@lists.sourceforge.net,
 Ilya Dryomov <idryomov@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>,
 devel@lists.orangefs.org, Shyam Prasad N <sprasad@microsoft.com>,
 Eric Van Hensbergen <ericvh@gmail.com>, Tom Talpey <tom@talpey.com>,
 linux-fsdevel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 ceph-devel@vger.kernel.org, Trond Myklebust <trond.myklebust@hammerspace.com>,
 linux-nfs@vger.kernel.org, Paulo Alcantara <pc@cjr.nz>,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 Ronnie Sahlberg <lsahlber@redhat.com>, Steve French <sfrench@samba.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Chuck Lever <chuck.lever@oracle.com>, Anna Schumaker <anna@kernel.org>,
 ocfs2-devel@oss.oracle.com, Joel Becker <jlbec@evilplan.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 21, 2022 at 09:26:16AM +0800, Xiubo Li wrote:
[1300+ lines snipped]
> LGTM.
> 
> Reviewed-by: Xiubo Li <xiubli@redhat.com>

You really don't need to quote the whole thing.  Please be more
considerate.

