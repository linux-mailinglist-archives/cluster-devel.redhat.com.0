Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E4D763C7A
	for <lists+cluster-devel@lfdr.de>; Wed, 26 Jul 2023 18:29:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690388947;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iIDJxMvMWjb2ZMMRY6z7HMerL44iWnloZy3fk6uRKdA=;
	b=hTQ7cDM63y4LfgoPozskvzl3VWALJPpEcRkRozKWQBn4SeOLB1w6CiPl1JDW298yqCjGzL
	3Elhv3iJ5yhCrbIRVMFQQ/cVRHVELE45rRwxQzK0EvIzsK24pgPIzSgroPByCVa2qc03oO
	/FnZ0bolemDCITVWQGbJrSm2Ns6U5co=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-491-4HvrxKk6NTe_937axXAAjw-1; Wed, 26 Jul 2023 12:29:04 -0400
X-MC-Unique: 4HvrxKk6NTe_937axXAAjw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E9CB6803FDF;
	Wed, 26 Jul 2023 16:29:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D5CCE145414A;
	Wed, 26 Jul 2023 16:29:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A8DC1193F504;
	Wed, 26 Jul 2023 16:29:03 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4CBCE1946A6C for <cluster-devel@listman.corp.redhat.com>;
 Wed, 26 Jul 2023 15:10:01 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1CB9F4026F1; Wed, 26 Jul 2023 15:10:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 12129492CAC
 for <cluster-devel@redhat.com>; Wed, 26 Jul 2023 15:10:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F1798631DB
 for <cluster-devel@redhat.com>; Wed, 26 Jul 2023 15:10:00 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-359-wynBQ8imPxexXfNFBQ7gPQ-1; Wed, 26 Jul 2023 11:09:57 -0400
X-MC-Unique: wynBQ8imPxexXfNFBQ7gPQ-1
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-3fd28ae8b90so73685e9.1
 for <cluster-devel@redhat.com>; Wed, 26 Jul 2023 08:09:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690384196; x=1690988996;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iIDJxMvMWjb2ZMMRY6z7HMerL44iWnloZy3fk6uRKdA=;
 b=EcNpLMiuXAGt7zbt/X2BTPDQK8LsZMaIiJ+AJdefCX/LzIiaqbwq7IC7t2l/xVx6ws
 kGemWAzoqR/exqcpI+kSwsjNCBg2ihUsxCDpiuKTTu0WirGyfTZUCvWhHThhFfVITYbF
 3Fky73oA610CjpX6E1OlagtS7OEf7NcZzRgGh5M2bqYl8L4jmvUcDYYtUVIXF/uh+JgB
 CXy2aC3jnpxvhMjPekfCl/JBXOqVVFFIaEh8Kp4LIr6gdhjhirJQSj9Ll9J7rNDDVBoO
 0+0cDcUetBGMaeGbog7vxhpKLfLkhM5xdczD5s2U+vfKQ7M700Xr1b43cdOo1ZbETvcc
 lAKA==
X-Gm-Message-State: ABy/qLZ7HoL5E3f4CKGFMKrAwxPuxf2Nd3dP7E5KXLYPlvl1LAxgqmr4
 hsTYYvuvchqKTQwvu8n7dviZaSsmUaVH2ZNSb6tmyQ==
X-Google-Smtp-Source: APBJJlFMrYG0fRVa96eL8vMcZWqP86Lvlb0UCs77E7/dASW1i+z4fcEOahx9NSDW9VqWJCbeZZqWfRHs/dBtvIHo8UM=
X-Received: by 2002:a05:600c:8612:b0:3f4:2736:b5eb with SMTP id
 ha18-20020a05600c861200b003f42736b5ebmr211152wmb.1.1690384195813; Wed, 26 Jul
 2023 08:09:55 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000002b5e2405f14e860f@google.com>
 <0000000000009655cc060165265f@google.com>
In-Reply-To: <0000000000009655cc060165265f@google.com>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Wed, 26 Jul 2023 17:09:43 +0200
Message-ID: <CANp29Y7UVO8QGJUC-WB=CT_MKJVUzpJ2pH+e6WAcwqX_4FPgpA@mail.gmail.com>
To: syzbot <syzbot+3f6a670108ce43356017@syzkaller.appspotmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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
Cc: konrad.dybcio@linaro.org, andersson@kernel.org,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 cluster-devel@redhat.com, linux-fsdevel@vger.kernel.org,
 dmitry.baryshkov@linaro.org, eadavis@sina.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 26, 2023 at 5:03=E2=80=AFPM syzbot
<syzbot+3f6a670108ce43356017@syzkaller.appspotmail.com> wrote:
>
> syzbot suspects this issue was fixed by commit:
>
> commit 41a37d157a613444c97e8f71a5fb2a21116b70d7
> Author: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Date:   Mon Dec 26 04:21:51 2022 +0000
>
>     arm64: dts: qcom: qcs404: use symbol names for PCIe resets
>
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=3D17b48111a8=
0000
> start commit:   [unknown]
> git tree:       upstream
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3Dfe56f7d193926=
860
> dashboard link: https://syzkaller.appspot.com/bug?extid=3D3f6a670108ce433=
56017
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D1209f878c80=
000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D111a48ab48000=
0
>
> If the result looks correct, please mark the issue as fixed by replying w=
ith:

No, it's quite unlikely.

>
> #syz fix: arm64: dts: qcom: qcs404: use symbol names for PCIe resets
>
> For information about bisection process see: https://goo.gl/tpsmEJ#bisect=
ion
>
> --
> You received this message because you are subscribed to the Google Groups=
 "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgi=
d/syzkaller-bugs/0000000000009655cc060165265f%40google.com.

