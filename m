Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8FC70E228
	for <lists+cluster-devel@lfdr.de>; Tue, 23 May 2023 18:49:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684860570;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=G5nor1odEvltlOg9yz8O08fTQiIli5/Sp675o7e3SQw=;
	b=DWIaof0jGb3lQJSO5jgh11weuTgEhiSuYhW7ESMXLq/+SK9CiF3eZb8qUkyt9HSJv/JgoK
	UW6svjz1kMJOkGbECyzyrIUogWY2e0+7ys40X6VuWil0hkPrrAQ5OVY72qWVV3HkbJaicJ
	zg0eYVfDAQf6uWx40DvsaFxnX5ifJFo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-rV1541G7N1q7GpkdRpK2QA-1; Tue, 23 May 2023 12:49:27 -0400
X-MC-Unique: rV1541G7N1q7GpkdRpK2QA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8783E101A53A;
	Tue, 23 May 2023 16:49:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 794C91121314;
	Tue, 23 May 2023 16:49:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 24B5119465B3;
	Tue, 23 May 2023 16:49:16 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BDC9A19465A0 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 23 May 2023 16:49:14 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 733F0C164EE; Tue, 23 May 2023 16:49:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B719C164ED
 for <cluster-devel@redhat.com>; Tue, 23 May 2023 16:49:13 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3818385A5BA
 for <cluster-devel@redhat.com>; Tue, 23 May 2023 16:49:13 +0000 (UTC)
Received: from out-42.mta0.migadu.com (out-42.mta0.migadu.com
 [91.218.175.42]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-298-pgAxsVhtNeGHWTpaJ0NQNA-1; Tue, 23 May 2023 12:49:10 -0400
X-MC-Unique: pgAxsVhtNeGHWTpaJ0NQNA-1
Date: Tue, 23 May 2023 12:49:06 -0400
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Jan Kara <jack@suse.cz>
Message-ID: <ZGzugpw7vgCFxOYL@moria.home.lan>
References: <20230509165657.1735798-1-kent.overstreet@linux.dev>
 <20230509165657.1735798-7-kent.overstreet@linux.dev>
 <20230510010737.heniyuxazlprrbd6@quack3>
 <ZFs3RYgdCeKjxYCw@moria.home.lan>
 <20230523133431.wwrkjtptu6vqqh5e@quack3>
MIME-Version: 1.0
In-Reply-To: <20230523133431.wwrkjtptu6vqqh5e@quack3>
X-Migadu-Flow: FLOW_OUT
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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
Cc: cluster-devel@redhat.com, "Darrick J . Wong" <djwong@kernel.org>,
 linux-kernel@vger.kernel.org, dhowells@redhat.com,
 linux-bcachefs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Kent Overstreet <kent.overstreet@gmail.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.dev
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> > No, that's definitely handled (and you can see it in the code I linked),
> > and I wrote a torture test for fstests as well.
> 
> I've checked the code and AFAICT it is all indeed handled. BTW, I've now
> remembered that GFS2 has dealt with the same deadlocks - b01b2d72da25
> ("gfs2: Fix mmap + page fault deadlocks for direct I/O") - in a different
> way (by prefaulting pages from the iter before grabbing the problematic
> lock and then disabling page faults for the iomap_dio_rw() call). I guess
> we should somehow unify these schemes so that we don't have two mechanisms
> for avoiding exactly the same deadlock. Adding GFS2 guys to CC.

Oof, that sounds a bit sketchy. What happens if the dio call passes in
an address from the same address space? What happens if we race with the
pages we faulted in being evicted?

> Also good that you've written a fstest for this, that is definitely a useful
> addition, although I suspect GFS2 guys added a test for this not so long
> ago when testing their stuff. Maybe they have a pointer handy?

More tests more good.

So if we want to lift this scheme to the VFS layer, we'd start by
replacing the lock you added (grepping for it, the name escapes me) with
a different type of lock - two_state_shared_lock in my code, it's like a
rw lock except writers don't exclude other writers. That way the DIO
path can use it without singlethreading writes to a single file.

