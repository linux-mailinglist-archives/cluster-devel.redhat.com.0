Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7C26EC945
	for <lists+cluster-devel@lfdr.de>; Mon, 24 Apr 2023 11:44:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682329495;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dX2LQ5A+RBvAKstMRiji1MQWzE/vAAjUzWsi3YEpVis=;
	b=b+TXZ/yjcfaiWSXI4hdlIStQ7r7R8acx4xiCo5BIg1c8qNN54A4ChJrrKLmEBD3vMTx1gq
	2zX4u/BUXZ6svDdJG6Z2va/FwVU6rYBcUhT5UTztpw+Hv3id+lAc5REZJ82hulu9ExgDYQ
	GG51Rc4f4yrHy+kgm+cxIaznZHvYjeI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-580-GD7J9qJsPtGMIQfCQhwyLA-1; Mon, 24 Apr 2023 05:44:50 -0400
X-MC-Unique: GD7J9qJsPtGMIQfCQhwyLA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 63A982A59569;
	Mon, 24 Apr 2023 09:44:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 56117404B24D;
	Mon, 24 Apr 2023 09:44:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id ECF951946594;
	Mon, 24 Apr 2023 09:44:47 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9B11F19466DF for <cluster-devel@listman.corp.redhat.com>;
 Sat, 22 Apr 2023 01:26:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7C85840BC798; Sat, 22 Apr 2023 01:26:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 744CA40C6EC4
 for <cluster-devel@redhat.com>; Sat, 22 Apr 2023 01:26:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 25EF23806626
 for <cluster-devel@redhat.com>; Sat, 22 Apr 2023 01:26:13 +0000 (UTC)
Received: from out198-148.us.a.mail.aliyun.com
 (out198-148.us.a.mail.aliyun.com [47.90.198.148]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384)
 id us-mta-364-Zz6KxbUTNneDmRk9QQtWog-1; Fri, 21 Apr 2023 21:26:10 -0400
X-MC-Unique: Zz6KxbUTNneDmRk9QQtWog-1
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.4532267|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_news_journal|0.588825-0.0022111-0.408964;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047205; MF=wangyugui@e16-tech.com; NM=1;
 PH=DS; RN=1; RT=1; SR=0; TI=SMTPD_---.SN-KJVx_1682126451
Received: from 192.168.2.112(mailfrom:wangyugui@e16-tech.com
 fp:SMTPD_---.SN-KJVx_1682126451) by smtp.aliyun-inc.com;
 Sat, 22 Apr 2023 09:20:52 +0800
Date: Sat, 22 Apr 2023 09:20:53 +0800
From: Wang Yugui <wangyugui@e16-tech.com>
To: cluster-devel@redhat.com
Message-Id: <20230422092052.F9C8.409509F4@e16-tech.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mailman-Approved-At: Mon, 24 Apr 2023 09:44:46 +0000
Subject: [Cluster-devel] question about gfs2 multiple device support
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: e16-tech.com
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

Hi,

Is there some work for gfs2 multiple device support?

if multiple device support,
1, No need of RAID 0/1/5/6 support.
   nvme SSD is fast enough for single thread write.

2, can we limit one journal into one device?

3, can we just write lock one device, so better write throughput?

Best Regards
Wang Yugui (wangyugui@e16-tech.com)
2023/04/22


