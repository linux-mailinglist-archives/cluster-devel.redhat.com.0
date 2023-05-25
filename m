Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 777F6711944
	for <lists+cluster-devel@lfdr.de>; Thu, 25 May 2023 23:40:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685050837;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=1+ot0AHqnS5E+xCikYR4N4Mm0zTlTHiB9/eZ4hj/nKQ=;
	b=eisqnnAlK6MJcRyXKbhOUb7+hgxV2GbZh+WB8BdUafBWONT+GYJdU8fH8HuUHEKlSxvRKN
	mwvKaRf16JWr7MjEMMa6RypRHXDlgzgqM/oUV8t64MFDOUklwcTZVvdFiTEfA3peM9w83L
	KDsglba9kCcCz8MRJIa3KqSpTmrwqds=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-207-pO9VFNG0MKiO3KAicy9U4Q-1; Thu, 25 May 2023 17:40:34 -0400
X-MC-Unique: pO9VFNG0MKiO3KAicy9U4Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2B8343C13504;
	Thu, 25 May 2023 21:40:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 205DA7AF5;
	Thu, 25 May 2023 21:40:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BCF5319465B1;
	Thu, 25 May 2023 21:40:32 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4081B19465A0 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 25 May 2023 21:40:32 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0C2A29D73; Thu, 25 May 2023 21:40:32 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0510C8162
 for <cluster-devel@redhat.com>; Thu, 25 May 2023 21:40:31 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DBF608002BF
 for <cluster-devel@redhat.com>; Thu, 25 May 2023 21:40:31 +0000 (UTC)
Received: from out-35.mta0.migadu.com (out-35.mta0.migadu.com
 [91.218.175.35]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-672-k4atQSo5PvK1Iqqiclt1UQ-1; Thu, 25 May 2023 17:40:30 -0400
X-MC-Unique: k4atQSo5PvK1Iqqiclt1UQ-1
Date: Thu, 25 May 2023 17:40:26 -0400
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <ZG/VyvdvM2l1kBnm@moria.home.lan>
References: <20230509165657.1735798-1-kent.overstreet@linux.dev>
 <20230509165657.1735798-7-kent.overstreet@linux.dev>
 <20230510010737.heniyuxazlprrbd6@quack3>
 <ZFs3RYgdCeKjxYCw@moria.home.lan>
 <20230523133431.wwrkjtptu6vqqh5e@quack3>
 <ZGzoJLCRLk+pCKAk@infradead.org> <ZGzrV5j7OUU6rYij@moria.home.lan>
 <ZG2yFFcpE7w/Glge@infradead.org> <ZG3GHoNnJJW4xX2H@moria.home.lan>
 <ZG8jJRcwtx3JQf6Q@infradead.org>
MIME-Version: 1.0
In-Reply-To: <ZG8jJRcwtx3JQf6Q@infradead.org>
X-Migadu-Flow: FLOW_OUT
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.dev
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 25, 2023 at 01:58:13AM -0700, Christoph Hellwig wrote:
> On Wed, May 24, 2023 at 04:09:02AM -0400, Kent Overstreet wrote:
> > > Well, it seems like you are talking about something else than the
> > > existing cases in gfs2 and btrfs, that is you want full consistency
> > > between direct I/O and buffered I/O.  That's something nothing in the
> > > kernel has ever provided, so I'd be curious why you think you need it
> > > and want different semantics from everyone else?
> > 
> > Because I like code that is correct.
> 
> Well, start with explaining your definition of correctness, why everyone
> else is "not correct", an how you can help fixing this correctness
> problem in the existing kernel.  Thanks for your cooperation!

BTW, if you wanted a more serious answer, just asking for the commit
message to be expanded would be a better way to ask...

