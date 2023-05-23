Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1096370E207
	for <lists+cluster-devel@lfdr.de>; Tue, 23 May 2023 18:46:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684860380;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=z+1sZNJGqmSSorNrp7Vi6hi24SWgmfSQeHF6o5ml3aM=;
	b=N29Ip9A4BzfBiMWhS33VtzQ0BxBTBuOHWbT0LcL0nQxq7ixkitj48vzZREn9qK6NwKujnC
	aXDxIErN5o6k0A0QnKY0m4sypavk0F0SN8p2Q0zRLFkRhqsH8hgbu+SdenBUpB1vCge9Z3
	l0f9xmmL5zrORQM1plREvYcgs2YgsiU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-los07i-sOZibo3z2YoV80A-1; Tue, 23 May 2023 12:46:14 -0400
X-MC-Unique: los07i-sOZibo3z2YoV80A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 82C251C09049;
	Tue, 23 May 2023 16:46:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4519C1121314;
	Tue, 23 May 2023 16:46:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E9ADA19465B3;
	Tue, 23 May 2023 16:46:07 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7A0BB19465A0 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 23 May 2023 16:41:36 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5D07B9D73; Tue, 23 May 2023 16:41:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 55BDB7AF5
 for <cluster-devel@redhat.com>; Tue, 23 May 2023 16:41:36 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3709B185A791
 for <cluster-devel@redhat.com>; Tue, 23 May 2023 16:41:36 +0000 (UTC)
Received: from out-40.mta0.migadu.com (out-40.mta0.migadu.com
 [91.218.175.40]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-251-EfY5VpphO6CiARRhOHmZuA-1; Tue, 23 May 2023 12:41:33 -0400
X-MC-Unique: EfY5VpphO6CiARRhOHmZuA-1
Date: Tue, 23 May 2023 12:35:35 -0400
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <ZGzrV5j7OUU6rYij@moria.home.lan>
References: <20230509165657.1735798-1-kent.overstreet@linux.dev>
 <20230509165657.1735798-7-kent.overstreet@linux.dev>
 <20230510010737.heniyuxazlprrbd6@quack3>
 <ZFs3RYgdCeKjxYCw@moria.home.lan>
 <20230523133431.wwrkjtptu6vqqh5e@quack3>
 <ZGzoJLCRLk+pCKAk@infradead.org>
MIME-Version: 1.0
In-Reply-To: <ZGzoJLCRLk+pCKAk@infradead.org>
X-Migadu-Flow: FLOW_OUT
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mailman-Approved-At: Tue, 23 May 2023 16:46:06 +0000
Subject: Re: [Cluster-devel] [PATCH 06/32] sched: Add
 task_struct->faults_disabled_mapping
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
Cc: dhowells@redhat.com, Jan Kara <jack@suse.cz>,
 "Darrick J . Wong" <djwong@kernel.org>, linux-kernel@vger.kernel.org,
 cluster-devel@redhat.com, linux-bcachefs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Kent Overstreet <kent.overstreet@gmail.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.dev
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 23, 2023 at 09:21:56AM -0700, Christoph Hellwig wrote:
> On Tue, May 23, 2023 at 03:34:31PM +0200, Jan Kara wrote:
> > I've checked the code and AFAICT it is all indeed handled. BTW, I've now
> > remembered that GFS2 has dealt with the same deadlocks - b01b2d72da25
> > ("gfs2: Fix mmap + page fault deadlocks for direct I/O") - in a different
> > way (by prefaulting pages from the iter before grabbing the problematic
> > lock and then disabling page faults for the iomap_dio_rw() call). I guess
> > we should somehow unify these schemes so that we don't have two mechanisms
> > for avoiding exactly the same deadlock. Adding GFS2 guys to CC.
> > 
> > Also good that you've written a fstest for this, that is definitely a useful
> > addition, although I suspect GFS2 guys added a test for this not so long
> > ago when testing their stuff. Maybe they have a pointer handy?
> 
> generic/708 is the btrfs version of this.
> 
> But I think all of the file systems that have this deadlock are actually
> fundamentally broken because they have a mess up locking hierarchy
> where page faults take the same lock that is held over the the direct I/
> operation.  And the right thing is to fix this.  I have work in progress
> for btrfs, and something similar should apply to gfs2, with the added
> complication that it probably means a revision to their network
> protocol.

No, this is fundamentally because userspace controls the ordering of
locking because the buffer passed to dio can point into any address
space. You can't solve this by changing the locking heirarchy.

If you want to be able to have locking around adding things to the
pagecache so that things that bypass the pagecache can prevent
inconsistencies (and we do, the big one is fcollapse), and if you want
dio to be able to use that same locking (because otherwise dio will also
cause page cache inconsistency), this is the way to do it.

