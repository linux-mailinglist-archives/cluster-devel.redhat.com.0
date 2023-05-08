Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFB96FBB05
	for <lists+cluster-devel@lfdr.de>; Tue,  9 May 2023 00:26:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683584764;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RyTm0MsqvORCPj1QJNehGGZrIKwX2OgqvMBNJ0HTVSY=;
	b=bzWnipkdCDqhJrevRid5+Qq/Oa+831Isl7NT5Gseibt11izwZhhpGrLs2+3zzTPOCgbTHS
	8krLXGO1FZORkZ5scpZEFYeOMTKFyR2SDHh2ZOTGiKF1Ki8srMCitNcpbPO6iR/o4psnI9
	8j3b9VtJPS9/e1k87p+LIaqum0WGO4k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-439-PxI4dTZKPVy7EPAbJcLoUA-1; Mon, 08 May 2023 18:26:01 -0400
X-MC-Unique: PxI4dTZKPVy7EPAbJcLoUA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9EA06185A79C;
	Mon,  8 May 2023 22:26:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1438340C2063;
	Mon,  8 May 2023 22:25:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 44FDC19452C7;
	Mon,  8 May 2023 22:25:57 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0CEC519452C4 for <cluster-devel@listman.corp.redhat.com>;
 Mon,  8 May 2023 22:25:56 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A288C492C3F; Mon,  8 May 2023 22:25:56 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9AF62492C13
 for <cluster-devel@redhat.com>; Mon,  8 May 2023 22:25:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 801BD811E7C
 for <cluster-devel@redhat.com>; Mon,  8 May 2023 22:25:56 +0000 (UTC)
Received: from out28-65.mail.aliyun.com (out28-65.mail.aliyun.com
 [115.124.28.65]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-282-nXjh_IqEN9WNoUW2Os8vmw-1; Mon, 08 May 2023 18:25:52 -0400
X-MC-Unique: nXjh_IqEN9WNoUW2Os8vmw-1
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.06713905|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.386611-0.0290723-0.584316;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047209; MF=wangyugui@e16-tech.com; NM=1;
 PH=DS; RN=2; RT=2; SR=0; TI=SMTPD_---.Sbwm.aG_1683584745
Received: from 192.168.2.112(mailfrom:wangyugui@e16-tech.com
 fp:SMTPD_---.Sbwm.aG_1683584745) by smtp.aliyun-inc.com;
 Tue, 09 May 2023 06:25:46 +0800
Date: Tue, 09 May 2023 06:25:46 +0800
From: Wang Yugui <wangyugui@e16-tech.com>
To: Steven Whitehouse <swhiteho@redhat.com>,
 cluster-devel@redhat.com
In-Reply-To: <20230424193510.4A1D.409509F4@e16-tech.com>
References: <9c75b6abc800aca8d8dae344460fde6a8080c53b.camel@redhat.com>
 <20230424193510.4A1D.409509F4@e16-tech.com>
Message-Id: <20230509062545.D02E.409509F4@e16-tech.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [Cluster-devel] question about gfs2 multiple device support
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
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: e16-tech.com
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

Hi,

> Hi,
> 
> > Hi,
> > 
> > On Sat, 2023-04-22 at 09:20 +0800, Wang Yugui wrote:
> > > Hi,
> > > 
> > > Is there some work for gfs2 multiple device support?
> > > 
> > Do you mean multiple devices generically, or specifically the md
> > driver?
> > 
> > > if multiple device support,
> > > 1, No need of RAID 0/1/5/6 support.
> > > ?? nvme SSD is fast enough for single thread write.
> > I'm not sure I understand this. Multiple device support generally means
> > at least one of the RAID modes.
> 
> we can support linear mode (same as lvcreate --type linear) only firstly.
> 
> > > 2, can we limit one journal into one device?
> > The filesystem always assumes a single device with one or more
> > journals. If multiple devices are used, that is done at the block
> > layer, which is below the filesystem layer.
> > 
> > > 
> > > 3, can we just write lock one device, so better write throughput?
> > Do you have a specific application in mind? Or certain performance
> > levels that you need to hit? The write performance will depend a lot on
> > the I/O pattern, and the underlying device performance. We'll need a
> > bit more detail to be more specific I'm afraid,
> 
> gfs2 use 'SCSI PERSISTENT RESERVE' or similar method to lock block device
> when multiple hosts access the gfs2 at the same time?

It seems that lock_dlm does NOT use  'SCSI PERSISTENT RESERVE' or similar method
to lock block device.

it lock in the unit of 'resource group'.

Best Regards
Wang Yugui (wangyugui@e16-tech.com)
2023/05/09


> if gfs2 use multiple device directly rather than through lvm, then we 
> can just lock one device rather than all device?
> - journal lock one device only
> - data write lock one device only.
> 
> Now SSD/SAN is very fast and become cheaper, and we can use multiple 
> SSD/SAN for one bigger filesystem and bigger HPC cluster?
> 
> Best Regards
> Wang Yugui (wangyugui@e16-tech.com)
> 2023/04/24


