Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 5612013C620
	for <lists+cluster-devel@lfdr.de>; Wed, 15 Jan 2020 15:34:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579098865;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mL6B82pSHYNjS6gkdrzAfxxaU1xve/htNZHV8Gzvgzs=;
	b=K2C1emBWaE6ZtUV+DlREqBdzEouiutJKzjZin4ujUK0tuVfOPIPfwbC3+VGj9WhWzLEbje
	OJKElHxfcngm4q43yTluOml2AMli35BI5O6Vd/u6plOvVOWV3j/fdfBd6XFLY73S0Er6VW
	pz4f8yib/sY3Yv40wRBIoBnrl8elOpg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-338N5g6HOzudupNBEd21xA-1; Wed, 15 Jan 2020 09:34:23 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E5F5F8C3B4C;
	Wed, 15 Jan 2020 14:34:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F33F1001281;
	Wed, 15 Jan 2020 14:34:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D654082514;
	Wed, 15 Jan 2020 14:34:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00FEY513008637 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 15 Jan 2020 09:34:05 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2F1EC2166B2C; Wed, 15 Jan 2020 14:34:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B10D2166B2B
	for <cluster-devel@redhat.com>; Wed, 15 Jan 2020 14:34:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BC9648EB47C
	for <cluster-devel@redhat.com>; Wed, 15 Jan 2020 14:34:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-352-5WXYBCZKOHe5GrYxqb23Xw-1; Wed, 15 Jan 2020 09:33:58 -0500
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
	helo=noisy.programming.kicks-ass.net)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irjjy-0001bu-Cy; Wed, 15 Jan 2020 14:33:50 +0000
Received: from hirez.programming.kicks-ass.net
	(hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 0596130257C;
	Wed, 15 Jan 2020 15:32:11 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 599A720B2867B; Wed, 15 Jan 2020 15:33:47 +0100 (CET)
Date: Wed, 15 Jan 2020 15:33:47 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Message-ID: <20200115143347.GL2827@hirez.programming.kicks-ass.net>
References: <20200114161225.309792-1-hch@lst.de>
	<20200114192700.GC22037@ziepe.ca> <20200115065614.GC21219@lst.de>
	<20200115132428.GA25201@ziepe.ca>
MIME-Version: 1.0
In-Reply-To: <20200115132428.GA25201@ziepe.ca>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-MC-Unique: 5WXYBCZKOHe5GrYxqb23Xw-1
X-MC-Unique: 338N5g6HOzudupNBEd21xA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00FEY513008637
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-mm@kvack.org, Ingo Molnar <mingo@redhat.com>,
	linux-fsdevel@vger.kernel.org, Waiman Long <longman@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>, linux-ext4@vger.kernel.org,
	Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>
Subject: Re: [Cluster-devel] RFC: hold i_rwsem until aio completes
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
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Wed, Jan 15, 2020 at 09:24:28AM -0400, Jason Gunthorpe wrote:

> I was interested because you are talking about allowing the read/write si=
de
> of a rw sem to be held across a return to user space/etc, which is the
> same basic problem.

No it is not; allowing the lock to be held across userspace doesn't
change the owner. This is a crucial difference, PI depends on there
being a distinct owner. That said, allowing the lock to be held across
userspace still breaks PI in that it completely wrecks the ability to
analyze the critical section.


