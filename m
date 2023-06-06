Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1802B724F17
	for <lists+cluster-devel@lfdr.de>; Tue,  6 Jun 2023 23:58:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686088730;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bEvLWAMI2HrDdFDMly243IsfR1f9K5j9sqCGWCbWAGM=;
	b=NeVMl6VkgUub0TnxIk+K54A9T1vdSWnKMrS6SpC39mcwGL2odw/FabCZBKBHoY5CE94YTt
	7HEf5PzydIF7uVtADIueGPPhsuRL1L1yk50F8hWCJO2XJvCqZZqNQTe/nbCSe3mVYnFZnp
	Kuv61OkpoVrI4jjc/ndz73CpIYVUxvc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-122-BLvxGbhAN92Ex7ErM0cUAw-1; Tue, 06 Jun 2023 17:58:46 -0400
X-MC-Unique: BLvxGbhAN92Ex7ErM0cUAw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ED9511C00B8E;
	Tue,  6 Jun 2023 21:58:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E229F140E954;
	Tue,  6 Jun 2023 21:58:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 996451946A45;
	Tue,  6 Jun 2023 21:58:45 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 12EA419465BA for <cluster-devel@listman.corp.redhat.com>;
 Tue,  6 Jun 2023 21:58:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E89C740336D; Tue,  6 Jun 2023 21:58:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E10AA403375
 for <cluster-devel@redhat.com>; Tue,  6 Jun 2023 21:58:44 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C5B6B811E78
 for <cluster-devel@redhat.com>; Tue,  6 Jun 2023 21:58:44 +0000 (UTC)
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-542-GJ8NXP-3OA2SpNFaWTDr8Q-1; Tue, 06 Jun 2023 17:58:36 -0400
X-MC-Unique: GJ8NXP-3OA2SpNFaWTDr8Q-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-974566553ccso510788066b.3
 for <cluster-devel@redhat.com>; Tue, 06 Jun 2023 14:58:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686088714; x=1688680714;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bEvLWAMI2HrDdFDMly243IsfR1f9K5j9sqCGWCbWAGM=;
 b=INRiVmsP66uayjFlfXLzlLKScQ8ZfuQtUBXb4YT521nR2K+VYYhYGBp9dpn4bVU5VZ
 Vp2fA9egVNPr4MW4wUnOT7/3PyZ0JgxY1nDWBDxU/U907LmrH2d8ZVr1RjPSu7EtzGGC
 3XpmOGQrpliIhIpDHBYN0kdHDlkn+ChUoxRSnKHnksKqk5/tVgawwUxkRlxI1PfhdDAo
 3biT8T8aRaHRDN8hES+hW4ZUcChRg811xshEbbpl5QKNeALsn0iHcPZg9U7ItVHYkiT8
 8meeNbKM/UrDSPc6Iv3/3GIIByZip5VIwY31JHUkFrM7hxshNSHgPoISMhVmKHcC7VCo
 JkLw==
X-Gm-Message-State: AC+VfDzeAM/brJVSrudxAxI4h2asHIQ2kPzp0lkHWjDaIcpQLgnNph/H
 ln1/e8m7KlB5AMnKgPhmsmyyxq/ZRhElZ4jPw/a4ayDV761aBFX9J0tKxuQN0vig0yaOiVZyy9x
 CzrqdX5BDurVy6yx4Zt4HXSfmsStqF8wQCbGTOFaJ3N6dIQ==
X-Received: by 2002:a17:906:5d05:b0:977:ab43:731f with SMTP id
 g5-20020a1709065d0500b00977ab43731fmr4124453ejt.66.1686088714477; 
 Tue, 06 Jun 2023 14:58:34 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6mAneljtJaJVoIl3T0+tmLxOSnJuYYjjRfAXA8ZeBiqS39RwPtiZMSEsnKb8ZpJXlNlhu5zYVFrqwj+rpbEWk=
X-Received: by 2002:a17:906:5d05:b0:977:ab43:731f with SMTP id
 g5-20020a1709065d0500b00977ab43731fmr4124441ejt.66.1686088714247; Tue, 06 Jun
 2023 14:58:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230606215626.327239-1-aahringo@redhat.com>
In-Reply-To: <20230606215626.327239-1-aahringo@redhat.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Tue, 6 Jun 2023 17:58:23 -0400
Message-ID: <CAK-6q+jad=WOEoKapcktJe+mxOS9GWdhkmRq=vUBLLuAGhY6RA@mail.gmail.com>
To: teigland@redhat.com
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [Cluster-devel] [PATCH dlm/next] fs: dlm: fix nfs async lock
 callback handling
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
Cc: cluster-devel@redhat.com, stable@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jun 6, 2023 at 5:56=E2=80=AFPM Alexander Aring <aahringo@redhat.com=
> wrote:
>
> This patch is fixing the current the callback handling if it's a nfs
> async lock request signaled if fl_lmops is set.
>
> When using `stress-ng --fcntl 32` on the kernel log there are several
> messages like:
>
> [11185.123533] dlm: dlm_plock_callback: vfs lock error 5d5127 file 000000=
002dd10f4d fl 000000007d13afae
> [11185.127135] dlm: dlm_plock_callback: vfs lock error 5d5127 file 000000=
002dd10f4d fl 00000000a6046fa0
> [11185.142668] dlm: dlm_plock_callback: vfs lock error 5d5127 file 000000=
002dd10f4d fl 000000001d13dfa5
>
> The commit 40595cdc93ed ("nfs: block notification on fs with its
> own ->lock") using only trylocks in an asynchronous polling behaviour. Th=
e
> behaviour before was however differently by evaluating F_SETLKW or F_SETL=
K
> and evaluating FL_SLEEP which was the case before commit 40595cdc93ed
> ("nfs: block notification on fs with its own ->lock"). This behaviour
> seems to be broken before. This patch will fix the behaviour for the
> special nfs case before commit 40595cdc93ed ("nfs: block notification on
> fs with its own ->lock").
>
> There is still a TODO of solving the case when an nfs locking request
> got interrupted.
>

sorry, I will rephrase that.

- Alex

