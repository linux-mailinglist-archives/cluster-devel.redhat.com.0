Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E02625532A5
	for <lists+cluster-devel@lfdr.de>; Tue, 21 Jun 2022 14:59:10 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-tX8m8orsOyOdvPv2qO_JHg-1; Tue, 21 Jun 2022 08:59:08 -0400
X-MC-Unique: tX8m8orsOyOdvPv2qO_JHg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5F2A5101E98A;
	Tue, 21 Jun 2022 12:59:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E5565C23DBF;
	Tue, 21 Jun 2022 12:59:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C91F5194704C;
	Tue, 21 Jun 2022 12:59:05 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E1A4B1947041 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 21 Jun 2022 12:59:04 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CAFC44050C40; Tue, 21 Jun 2022 12:59:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C6819404E4DF
 for <cluster-devel@redhat.com>; Tue, 21 Jun 2022 12:59:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B27C7811E7A
 for <cluster-devel@redhat.com>; Tue, 21 Jun 2022 12:59:04 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-wHGJJlSvMPC-xnPjSpU-5w-1; Tue, 21 Jun 2022 08:59:00 -0400
X-MC-Unique: wHGJJlSvMPC-xnPjSpU-5w-1
Received: by verein.lst.de (Postfix, from userid 2407)
 id 9777368AA6; Tue, 21 Jun 2022 14:58:57 +0200 (CEST)
Date: Tue, 21 Jun 2022 14:58:57 +0200
From: Christoph Hellwig <hch@lst.de>
To: Andrew Price <anprice@redhat.com>
Message-ID: <20220621125857.GA6999@lst.de>
References: <20220621091420.GC3256@lst.de>
 <97a9a768-1915-f532-09a4-99ee78a639ae@redhat.com>
MIME-Version: 1.0
In-Reply-To: <97a9a768-1915-f532-09a4-99ee78a639ae@redhat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: Re: [Cluster-devel] Mounting lock_nolock file systems?
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
Cc: cluster-devel@redhat.com, Christoph Hellwig <hch@lst.de>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 21, 2022 at 12:19:02PM +0100, Andrew Price wrote:
> On 21/06/2022 10:14, Christoph Hellwig wrote:
>> I'm felling a little stupid, but in the past after a
>>
>> mkfs.gfs2  -O -p lock_nolock
>>
>> I could just mount the created file system locally.
>>
>> On current mainline that does not seem to work any more, what am I
>> missing?
>
> I can't reproduce the problem on current mainline. What version of 
> gfs2-utils is your mkfs.gfs2 from?

Sorry, actually it was the pagecache for-next branch from willy.  Looks
like mainline itself is fine.

I'll try to get the superblock information from the pagecache branch
once I find a little time, chasing a bunch of other bugs in the meantime.

