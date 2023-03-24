Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5BA6C9CE2
	for <lists+cluster-devel@lfdr.de>; Mon, 27 Mar 2023 09:55:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679903726;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zj2rSWb1TY4pRH2CJrKhLgINCPnlbpAhrLKT1TLUAhQ=;
	b=WvQz93u9x8o+AdVsJwV0+uWLJ5z9ATZnkEUKudrfOODClUWqV2nZZDHroIYZDxvWDScJip
	HzPwtdtpnfrJrOKdTBW2Jv90ucfV7a247P3eN9g5jZyjBtcSLNtDaQsagUp6WR0SC9zUBJ
	C1pGaTsNaWYcT89ajLTND896ZXoxB1M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-449-xCxnlfaFOJWTs-6oFIMG3Q-1; Mon, 27 Mar 2023 03:55:25 -0400
X-MC-Unique: xCxnlfaFOJWTs-6oFIMG3Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2A99B85C06D;
	Mon, 27 Mar 2023 07:55:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1FF7B2166B29;
	Mon, 27 Mar 2023 07:55:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B7B5C19465B3;
	Mon, 27 Mar 2023 07:55:22 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3CA701946A5A for <cluster-devel@listman.corp.redhat.com>;
 Fri, 24 Mar 2023 20:27:08 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1F784492B00; Fri, 24 Mar 2023 20:27:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 18E8D492C3E
 for <cluster-devel@redhat.com>; Fri, 24 Mar 2023 20:27:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0188485A5B1
 for <cluster-devel@redhat.com>; Fri, 24 Mar 2023 20:27:08 +0000 (UTC)
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-228-UYwTtJRkM_211nRQOXeZbQ-1; Fri, 24 Mar 2023 16:27:06 -0400
X-MC-Unique: UYwTtJRkM_211nRQOXeZbQ-1
Received: from fpc.intra.ispras.ru (unknown [10.10.165.3])
 by mail.ispras.ru (Postfix) with ESMTPSA id 911D3406BB55;
 Fri, 24 Mar 2023 20:19:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 911D3406BB55
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	stable@vger.kernel.org
Date: Fri, 24 Mar 2023 23:19:32 +0300
Message-Id: <20230324201933.329885-1-pchelkin@ispras.ru>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mailman-Approved-At: Mon, 27 Mar 2023 07:55:21 +0000
Subject: [Cluster-devel] [PATCH 4.19/5.4/5.10 0/1] gfs2: Always check inode
 size of inline inodes
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
Cc: lvc-project@linuxtesting.org, linux-kernel@vger.kernel.org,
 Fedor Pchelkin <pchelkin@ispras.ru>, cluster-devel@redhat.com,
 Alexey Khoroshilov <khoroshilov@ispras.ru>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: ispras.ru
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Kernel bug in iomap_read_inline_data() fixed by the following patch is hit
on older stables 4.19/5.4/5.10.

The patch failed to be initially backported into stable branches older
than 5.15 due to the upstream commit 7db354444ad8 ("gfs2: Cosmetic
gfs2_dinode_{in,out} cleanup").

Now it can be cleanly applied to the 4.19/5.4/5.10 stable branches.

