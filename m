Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B63764FE0
	for <lists+cluster-devel@lfdr.de>; Thu, 27 Jul 2023 11:33:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690450428;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8wyKibTr8k/NSeubFc4y5q8h8vNK9/oynyCVrZ6x5+Q=;
	b=Y5TOne2ystMV4ZNatIbeRHxSdBqffs1uY24ZxqNbPnRrXRBEX5nvrkLdo95AerXc/PZIGe
	pnZWoOiiHbF+qFI1tB7/pfwcVLPm0/5JBsSG1oG9My1M6WEXyf7evZAVKBG5smjq1wVeKV
	6kySUgNcHuZo7ywtpknW+heXwaWrSIw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-597-5Sv4C6IHO-u4TjNSsv0gsw-1; Thu, 27 Jul 2023 05:33:45 -0400
X-MC-Unique: 5Sv4C6IHO-u4TjNSsv0gsw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C4084803FEF;
	Thu, 27 Jul 2023 09:33:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B8EDA40C2063;
	Thu, 27 Jul 2023 09:33:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 85C151946A75;
	Thu, 27 Jul 2023 09:33:44 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BE30F1946A6C for <cluster-devel@listman.corp.redhat.com>;
 Wed, 26 Jul 2023 15:03:41 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A0923F7836; Wed, 26 Jul 2023 15:03:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 98404F782E
 for <cluster-devel@redhat.com>; Wed, 26 Jul 2023 15:03:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 78A783C1014E
 for <cluster-devel@redhat.com>; Wed, 26 Jul 2023 15:03:36 +0000 (UTC)
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-raPhzezBOFSRcxV-UednPw-1; Wed, 26 Jul 2023 11:03:32 -0400
X-MC-Unique: raPhzezBOFSRcxV-UednPw-1
Received: by mail-oi1-f198.google.com with SMTP id
 5614622812f47-3a1e869ed0aso11097440b6e.2
 for <cluster-devel@redhat.com>; Wed, 26 Jul 2023 08:03:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690383811; x=1690988611;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8wyKibTr8k/NSeubFc4y5q8h8vNK9/oynyCVrZ6x5+Q=;
 b=ABhYmmcf2Jg/yXPz9X2F+et9G53nFUzOfn5gLz0AjCzcp6XDKK3NNmG/4UhHyB0nog
 grjLubsVSa0KRjiX+DZlZd8rgW4XANfbSqG++Y/UtmXXO5p0HfFU9ONNe/3uM2WzlIPT
 JnAMH6JpqwXM0iaf7IHaJnzSOH9QCntb7mPdL2ju2PKlwsSbdr8vmaWB48qTKIGoo2Ut
 7iWRvO88xLrz9a37uNytJRnbMWAo3i776vR5JQaduW/0VRJqD52qgess1aowhcNE5X5A
 NHcEAQXGVNC/hn+T67YXnbVruStSvX4GzHY4aNUtkCPsr/36WIstRixEoaviw2dK5a1h
 gQeA==
X-Gm-Message-State: ABy/qLazziS6kIAUR1DtzuyyfHzER0tX877MAKNZfZQrkf5TjACBwNxP
 qJKXDtAyeLT/FT5tpo0k8gVulaD8d9uf2s1xvIMWkdFhwMR2
X-Google-Smtp-Source: APBJJlHVqSyLEBclB3tQD4vr9mZJ9hegiZ1FlT2olGWiMvQebgqSxbAMmWl0J/vYqeFidm1ZBu0jFydr0CDmwU8Z1xWGp11AFQAU
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1206:b0:3a4:8115:5e7 with SMTP id
 a6-20020a056808120600b003a4811505e7mr5403236oil.10.1690383810972; Wed, 26 Jul
 2023 08:03:30 -0700 (PDT)
Date: Wed, 26 Jul 2023 08:03:30 -0700
In-Reply-To: <0000000000002b5e2405f14e860f@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000009655cc060165265f@google.com>
From: syzbot <syzbot+3f6a670108ce43356017@syzkaller.appspotmail.com>
To: agruenba@redhat.com, andersson@kernel.org, cluster-devel@redhat.com, 
 dmitry.baryshkov@linaro.org, eadavis@sina.com, konrad.dybcio@linaro.org, 
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rpeterso@redhat.com, syzkaller-bugs@googlegroups.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Mimecast-Spam-Signature: yes
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mailman-Approved-At: Thu, 27 Jul 2023 09:32:08 +0000
Subject: Re: [Cluster-devel] [syzbot] [gfs2?] KASAN: use-after-free Read in
 qd_unlock (2)
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
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 41a37d157a613444c97e8f71a5fb2a21116b70d7
Author: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon Dec 26 04:21:51 2022 +0000

    arm64: dts: qcom: qcs404: use symbol names for PCIe resets

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=17b48111a80000
start commit:   [unknown] 
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=fe56f7d193926860
dashboard link: https://syzkaller.appspot.com/bug?extid=3f6a670108ce43356017
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1209f878c80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=111a48ab480000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: arm64: dts: qcom: qcs404: use symbol names for PCIe resets

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

