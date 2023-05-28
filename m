Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0369A713A6E
	for <lists+cluster-devel@lfdr.de>; Sun, 28 May 2023 17:53:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685289212;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ggxjiN66eoar97S8tTYDGtlerH4d1SBiZn+ABpcSKRE=;
	b=D87st4S0l2R0XeobE5Xg471qY7wedyIiGkvK5uecTl+GV0gKZrSPYyCl0ru9sfeax1LkhT
	ztYJzExq+IGgeXERrW5Ko+wVRWyEeHlh5RXnzOtGdw33lECXCyDIzSHC/YHZUBjlcM5OhD
	tUHE0tZNKgsb1Z5NrVR8S1A9qQ90FuQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-Y4qJdOEaMhqJJPCTyWIaPw-1; Sun, 28 May 2023 11:53:29 -0400
X-MC-Unique: Y4qJdOEaMhqJJPCTyWIaPw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9830B185A78F;
	Sun, 28 May 2023 15:53:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A4462492B0A;
	Sun, 28 May 2023 15:53:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4922B19465A2;
	Sun, 28 May 2023 15:53:24 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4D208194658C for <cluster-devel@listman.corp.redhat.com>;
 Sun, 28 May 2023 15:53:22 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CEE7F40CF8F6; Sun, 28 May 2023 15:53:21 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C857440CF8EE
 for <cluster-devel@redhat.com>; Sun, 28 May 2023 15:53:21 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 70AA31C0515B
 for <cluster-devel@redhat.com>; Sun, 28 May 2023 15:53:21 +0000 (UTC)
Received: from out28-86.mail.aliyun.com (out28-86.mail.aliyun.com
 [115.124.28.86]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-57-UFqHsMdTO66lmzfMYPlR_Q-1; Sun, 28 May 2023 11:53:18 -0400
X-MC-Unique: UFqHsMdTO66lmzfMYPlR_Q-1
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1322099|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0385983-0.000103678-0.961298;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047213; MF=wangyugui@e16-tech.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.TEnfwM8_1685289193
Received: from 192.168.2.112(mailfrom:wangyugui@e16-tech.com
 fp:SMTPD_---.TEnfwM8_1685289193) by smtp.aliyun-inc.com;
 Sun, 28 May 2023 23:53:14 +0800
Date: Sun, 28 May 2023 23:53:15 +0800
From: Wang Yugui <wangyugui@e16-tech.com>
To: cluster-devel@redhat.com, linux-fsdevel@vger.kernel.org,
 linux-xfs@vger.kernel.org, Dave Chinner <david@fromorbit.com>,
 Christoph Hellwig <hch@infradead.org>,
 "Darrick J . Wong" <djwong@kernel.org>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>
In-Reply-To: <20230523085929.614A.409509F4@e16-tech.com>
References: <20230523085929.614A.409509F4@e16-tech.com>
Message-Id: <20230528235314.7852.409509F4@e16-tech.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: Re: [Cluster-devel] gfs2 write bandwidth regression on 6.4-rc3
 compareto 5.15.y
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: e16-tech.com
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

Hi,

> Hi,
> 
> gfs2 write bandwidth regression on 6.4-rc3 compare to 5.15.y.
> 
> we added  linux-xfs@ and linux-fsdevel@ because some related problem[1]
> and related patches[2].
> 
> we compared 6.4-rc3(rather than 6.1.y) to 5.15.y becasue some related patches[2]
> work only for 6.4 now.
> 
> [1] https://lore.kernel.org/linux-xfs/20230508172406.1CF3.409509F4@e16-tech.com/
> [2] https://lore.kernel.org/linux-xfs/20230520163603.1794256-1-willy@infradead.org/
> 
> 
> test case:
> 1) PCIe3 SSD *4 with LVM
> 2) gfs2 lock_nolock
>     gfs2 attr(T) GFS2_AF_ORLOV
>    # chattr +T /mnt/test
> 3) fio
> fio --name=global --rw=write -bs=1024Ki -size=32Gi -runtime=30 -iodepth 1
> -ioengine sync -zero_buffers=1 -direct=0 -end_fsync=1 -numjobs=1 \
> 	-name write-bandwidth-1 -filename=/mnt/test/sub1/1.txt \
> 	-name write-bandwidth-2 -filename=/mnt/test/sub2/1.txt \
> 	-name write-bandwidth-3 -filename=/mnt/test/sub3/1.txt \
> 	-name write-bandwidth-4 -filename=/mnt/test/sub4/1.txt
> 4) patches[2] are applied to 6.4-rc3.
> 
> 
> 5.15.y result
> 	fio WRITE: bw=5139MiB/s (5389MB/s),
> 6.4-rc3 result
> 	fio  WRITE: bw=2599MiB/s (2725MB/s)

more test result:

5.17.0	WRITE: bw=4988MiB/s (5231MB/s)
5.18.0	WRITE: bw=5165MiB/s (5416MB/s)
5.19.0	WRITE: bw=5511MiB/s (5779MB/s)
6.0.5	WRITE: bw=3055MiB/s (3203MB/s),	WRITE: bw=3225MiB/s (3382MB/s)
6.1.30	WRITE: bw=2579MiB/s (2705MB/s)

so this regression  happen in some code introduced in 6.0,
and maybe some minor regression in 6.1 too?

Best Regards
Wang Yugui (wangyugui@e16-tech.com)
2023/05/28

