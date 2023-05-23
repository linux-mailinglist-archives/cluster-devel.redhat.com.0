Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A16970CFE6
	for <lists+cluster-devel@lfdr.de>; Tue, 23 May 2023 02:59:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684803587;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Ic45Y4Un1vMP1Sj8gF7sn253tNuyyIeglhrEmJARDjI=;
	b=XaipYV5yEPh6sMV7HYjQNEIn++DOYmm/k9C3TviUsXwFEEphn5IKxvlcfMcqGGej5rENNw
	SA844AeEFfCDPvNsOIMAFrKwc7O0leRyac3JePTmP8Xr6aZANIIklnDXrSWox2DpmVA2Z1
	yAqRqGjKIphdDDy32Y4oNLCwjgKgyDo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-307-FsmeNmhdMlCJulWkTEGWkw-1; Mon, 22 May 2023 20:59:43 -0400
X-MC-Unique: FsmeNmhdMlCJulWkTEGWkw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 88D35101AA42;
	Tue, 23 May 2023 00:59:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7288D40CFD45;
	Tue, 23 May 2023 00:59:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1F11E19465B1;
	Tue, 23 May 2023 00:59:41 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EEC3F1946595 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 23 May 2023 00:59:39 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B947140CFD48; Tue, 23 May 2023 00:59:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B26D640CFD46
 for <cluster-devel@redhat.com>; Tue, 23 May 2023 00:59:39 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9BDA9101A531
 for <cluster-devel@redhat.com>; Tue, 23 May 2023 00:59:39 +0000 (UTC)
Received: from out28-41.mail.aliyun.com (out28-41.mail.aliyun.com
 [115.124.28.41]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-56-Pg7Ka6B4PuqjAHBZTA9W9w-1; Mon, 22 May 2023 20:59:36 -0400
X-MC-Unique: Pg7Ka6B4PuqjAHBZTA9W9w-1
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1252176|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_enroll_verification|0.0240655-4.02396e-05-0.975894;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047187; MF=wangyugui@e16-tech.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.T9RQ-uT_1684803569
Received: from 192.168.2.112(mailfrom:wangyugui@e16-tech.com
 fp:SMTPD_---.T9RQ-uT_1684803569) by smtp.aliyun-inc.com;
 Tue, 23 May 2023 08:59:30 +0800
Date: Tue, 23 May 2023 08:59:30 +0800
From: Wang Yugui <wangyugui@e16-tech.com>
To: cluster-devel@redhat.com
Message-Id: <20230523085929.614A.409509F4@e16-tech.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: [Cluster-devel] gfs2 write bandwidth regression on 6.4-rc3
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
Cc: "Darrick J . Wong" <djwong@kernel.org>, Dave Chinner <david@fromorbit.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: e16-tech.com
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

Hi,

gfs2 write bandwidth regression on 6.4-rc3 compare to 5.15.y.

we added  linux-xfs@ and linux-fsdevel@ because some related problem[1]
and related patches[2].

we compared 6.4-rc3(rather than 6.1.y) to 5.15.y becasue some related patches[2]
work only for 6.4 now.

[1] https://lore.kernel.org/linux-xfs/20230508172406.1CF3.409509F4@e16-tech.com/
[2] https://lore.kernel.org/linux-xfs/20230520163603.1794256-1-willy@infradead.org/


test case:
1) PCIe3 SSD *4 with LVM
2) gfs2 lock_nolock
    gfs2 attr(T) GFS2_AF_ORLOV
   # chattr +T /mnt/test
3) fio
fio --name=global --rw=write -bs=1024Ki -size=32Gi -runtime=30 -iodepth 1
-ioengine sync -zero_buffers=1 -direct=0 -end_fsync=1 -numjobs=1 \
	-name write-bandwidth-1 -filename=/mnt/test/sub1/1.txt \
	-name write-bandwidth-2 -filename=/mnt/test/sub2/1.txt \
	-name write-bandwidth-3 -filename=/mnt/test/sub3/1.txt \
	-name write-bandwidth-4 -filename=/mnt/test/sub4/1.txt
4) patches[2] are applied to 6.4-rc3.


5.15.y result
	fio WRITE: bw=5139MiB/s (5389MB/s),
6.4-rc3 result
	fio  WRITE: bw=2599MiB/s (2725MB/s)

Best Regards
Wang Yugui (wangyugui@e16-tech.com)
2023/05/23


