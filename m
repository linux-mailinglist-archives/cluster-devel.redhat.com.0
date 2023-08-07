Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F544772797
	for <lists+cluster-devel@lfdr.de>; Mon,  7 Aug 2023 16:23:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691418236;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=miXhKIkPE3lmozcU/B+jO2gbohIQfxtvXQrL6JQrLaA=;
	b=NaeKIxSK0MXFLDBtVQfsMprDvFX16yvbUsv3slpDrDwXMJJiieIHBikEc3Yl3NzOuONJAM
	P6wXlA+Vtgix3fJvubNOlgi3V5GogoQfNqNnrJxCeY6z40bfpbqJmqUqkx0QPEa7gp1V00
	br7CBxfrjPfGsHdw4uPZQmbXlTHUup4=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-228-lRm4Xfj2OG29qQquUjoE1w-1; Mon, 07 Aug 2023 10:23:52 -0400
X-MC-Unique: lRm4Xfj2OG29qQquUjoE1w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A26753C1350B;
	Mon,  7 Aug 2023 14:23:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 96F8140C2077;
	Mon,  7 Aug 2023 14:23:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 465421946589;
	Mon,  7 Aug 2023 14:23:45 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 642C11946588 for <cluster-devel@listman.corp.redhat.com>;
 Mon,  7 Aug 2023 14:14:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C82061121315; Mon,  7 Aug 2023 14:14:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BF7DA1121314
 for <cluster-devel@redhat.com>; Mon,  7 Aug 2023 14:14:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9672C29AA3A5
 for <cluster-devel@redhat.com>; Mon,  7 Aug 2023 14:14:57 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-2FhlCo4IN76vWtoy3JGRrQ-1; Mon, 07 Aug 2023 10:14:55 -0400
X-MC-Unique: 2FhlCo4IN76vWtoy3JGRrQ-1
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2b9f0b7af65so70124641fa.1
 for <cluster-devel@redhat.com>; Mon, 07 Aug 2023 07:14:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691417694; x=1692022494;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=miXhKIkPE3lmozcU/B+jO2gbohIQfxtvXQrL6JQrLaA=;
 b=eBzHYoc25ynAl3HGgYrfD6NGzkkZrFeuwINwGvT+2ex/dNRwcnEogR1g3489yM5dwF
 IMvNgVwRIXgZTOUD07X/qaEITyxkXOijRYPJNekZHtOAGAgduHrtvm1015zUR+gVylME
 RLJbVHFLRc3+NcD7ZVx8s6n7J8rM5Ze3XLff464fMthAvrd6BYoJzpLpe8kAlOsv47hL
 URSFyofg5kQ70MXg5nzMZ8I7XcYVkv+APFCFnG1ySpPshwTzlRbwRPLuaV1QrfGiZCPR
 bAZjUrie/2h9sH+hdcxBOdt6z+lXgqZ1EcUDLk21Mrs4ano7k5bMvZQaUfQG4DLJWsvQ
 6ycQ==
X-Gm-Message-State: AOJu0Yy3+6gR4hPMoyvMcI3vH8ieTkaVF//UHoMfZLapMCFC0MChPy2X
 QfCDgWPpXZeWpaO9tchwsQs5Dv7crbmm+sR234ducQ==
X-Google-Smtp-Source: AGHT+IEUzxQ8uhfef4Gwj5w4R2S1a/fG2YmFdaAnrERcAODuTjnUg5MW8ffcyCI3WwFTK01hsv/WyE2OTkrmMwFZBOU=
X-Received: by 2002:a2e:9254:0:b0:2b6:dfef:d526 with SMTP id
 v20-20020a2e9254000000b002b6dfefd526mr6547671ljg.11.1691417693488; Mon, 07
 Aug 2023 07:14:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
 <20230807110936.21819-20-zhengqi.arch@bytedance.com>
In-Reply-To: <20230807110936.21819-20-zhengqi.arch@bytedance.com>
From: Joel Fernandes <joel@joelfernandes.org>
Date: Mon, 7 Aug 2023 10:14:48 -0400
Message-ID: <CAEXW_YQHGBE2kKupLf12BGOEU5GnQsBUtVQcyMnzxUZ4y48QFA@mail.gmail.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mailman-Approved-At: Mon, 07 Aug 2023 14:23:44 +0000
Subject: Re: [Cluster-devel] [PATCH v4 19/48] rcu: dynamically allocate the
 rcu-kfree shrinker
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
Cc: kvm@vger.kernel.org, djwong@kernel.org, roman.gushchin@linux.dev,
 david@fromorbit.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org, cel@kernel.org,
 x86@kernel.org, steven.price@arm.com, cluster-devel@redhat.com,
 simon.horman@corigine.com, xen-devel@lists.xenproject.org,
 linux-ext4@vger.kernel.org, paulmck@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-nfs@vger.kernel.org, rcu@vger.kernel.org, linux-bcache@vger.kernel.org,
 dlemoal@kernel.org, yujie.liu@intel.com, vbabka@suse.cz,
 linux-raid@vger.kernel.org, brauner@kernel.org, tytso@mit.edu,
 gregkh@linuxfoundation.org, muchun.song@linux.dev,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, senozhatsky@chromium.org, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org, tkhai@ya.ru
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: joelfernandes.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 7, 2023 at 7:17=E2=80=AFAM Qi Zheng <zhengqi.arch@bytedance.com=
> wrote:
>
> Use new APIs to dynamically allocate the rcu-kfree shrinker.
>
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>

For RCU:
Reviewed-by: Joel Fernandes (Google) <joel@joelfernandes.org>

thanks,

- Joel


> ---
>  kernel/rcu/tree.c | 22 +++++++++++++---------
>  1 file changed, 13 insertions(+), 9 deletions(-)
>
> diff --git a/kernel/rcu/tree.c b/kernel/rcu/tree.c
> index 7c79480bfaa0..3b20fc46c514 100644
> --- a/kernel/rcu/tree.c
> +++ b/kernel/rcu/tree.c
> @@ -3449,13 +3449,6 @@ kfree_rcu_shrink_scan(struct shrinker *shrink, str=
uct shrink_control *sc)
>         return freed =3D=3D 0 ? SHRINK_STOP : freed;
>  }
>
> -static struct shrinker kfree_rcu_shrinker =3D {
> -       .count_objects =3D kfree_rcu_shrink_count,
> -       .scan_objects =3D kfree_rcu_shrink_scan,
> -       .batch =3D 0,
> -       .seeks =3D DEFAULT_SEEKS,
> -};
> -
>  void __init kfree_rcu_scheduler_running(void)
>  {
>         int cpu;
> @@ -4931,6 +4924,7 @@ static void __init kfree_rcu_batch_init(void)
>  {
>         int cpu;
>         int i, j;
> +       struct shrinker *kfree_rcu_shrinker;
>
>         /* Clamp it to [0:100] seconds interval. */
>         if (rcu_delay_page_cache_fill_msec < 0 ||
> @@ -4962,8 +4956,18 @@ static void __init kfree_rcu_batch_init(void)
>                 INIT_DELAYED_WORK(&krcp->page_cache_work, fill_page_cache=
_func);
>                 krcp->initialized =3D true;
>         }
> -       if (register_shrinker(&kfree_rcu_shrinker, "rcu-kfree"))
> -               pr_err("Failed to register kfree_rcu() shrinker!\n");
> +
> +       kfree_rcu_shrinker =3D shrinker_alloc(0, "rcu-kfree");
> +       if (!kfree_rcu_shrinker) {
> +               pr_err("Failed to allocate kfree_rcu() shrinker!\n");
> +               return;
> +       }
> +
> +       kfree_rcu_shrinker->count_objects =3D kfree_rcu_shrink_count;
> +       kfree_rcu_shrinker->scan_objects =3D kfree_rcu_shrink_scan;
> +       kfree_rcu_shrinker->seeks =3D DEFAULT_SEEKS;
> +
> +       shrinker_register(kfree_rcu_shrinker);
>  }
>
>  void __init rcu_init(void)
> --
> 2.30.2
>

