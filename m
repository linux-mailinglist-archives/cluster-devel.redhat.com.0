Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0E463350E
	for <lists+cluster-devel@lfdr.de>; Tue, 22 Nov 2022 07:07:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669097237;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=NuXayn1+w0SHdbQyKsd1ZU9Kcfyk82WXZB9TYE09jaM=;
	b=i9svji6k4Bk5PZKyThCUNDi3eXBHhdzQDCmyl0/buLR5t7m6S38Rd9IPjFct0o6cEHQIr4
	PpvdBs/07uc84kxDYnOmN9L0bsa57dMWX+XKI0BAANC/6QAtdOlTLlBMDScbIBFWg8FP/G
	Q2LY/9vBy/TMcVGN8bc/OriJ72X1BH4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-PmBE_lGmOha3kcZ4tC86OA-1; Tue, 22 Nov 2022 01:07:14 -0500
X-MC-Unique: PmBE_lGmOha3kcZ4tC86OA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4BF8C1C07592;
	Tue, 22 Nov 2022 06:07:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3F64CC15E76;
	Tue, 22 Nov 2022 06:07:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 22216194658F;
	Tue, 22 Nov 2022 06:07:13 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1A1B11946588 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 22 Nov 2022 06:07:12 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id F28664A9254; Tue, 22 Nov 2022 06:07:11 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EB5A64A9256
 for <cluster-devel@redhat.com>; Tue, 22 Nov 2022 06:07:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D534329DD983
 for <cluster-devel@redhat.com>; Tue, 22 Nov 2022 06:07:11 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-490-aOEoxRRWMmaOhPEXoQ8VuA-1; Tue, 22 Nov 2022 01:07:06 -0500
X-MC-Unique: aOEoxRRWMmaOhPEXoQ8VuA-1
Received: by verein.lst.de (Postfix, from userid 2407)
 id 6CF9A68D05; Tue, 22 Nov 2022 07:06:59 +0100 (CET)
Date: Tue, 22 Nov 2022 07:06:59 +0100
From: Christoph Hellwig <hch@lst.de>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20221122060659.GA14084@lst.de>
References: <20221120210004.381842-1-jlayton@kernel.org>
 <Y3xHQwM3UiD/SK0K@casper.infradead.org>
MIME-Version: 1.0
In-Reply-To: <Y3xHQwM3UiD/SK0K@casper.infradead.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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
 ceph-devel@vger.kernel.org, Xiubo Li <xiubli@redhat.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>, linux-nfs@vger.kernel.org,
 Paulo Alcantara <pc@cjr.nz>, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, Ronnie Sahlberg <lsahlber@redhat.com>,
 Steve French <sfrench@samba.org>,
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

On Tue, Nov 22, 2022 at 03:51:31AM +0000, Matthew Wilcox wrote:
> These two seem undefined at this point.
> 
> > +	struct fasync_struct *	fl_fasync; /* for lease break notifications */

Given that we just use a pointer to it there is no need to have a
definition.

