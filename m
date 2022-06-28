Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9786655BFA8
	for <lists+cluster-devel@lfdr.de>; Tue, 28 Jun 2022 10:58:43 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-159-KSn1rcUVP8KjXbwg0EPonA-1; Tue, 28 Jun 2022 04:58:31 -0400
X-MC-Unique: KSn1rcUVP8KjXbwg0EPonA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E60B53C0CD4D;
	Tue, 28 Jun 2022 08:58:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 64E181415108;
	Tue, 28 Jun 2022 08:58:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 288F419466DF;
	Tue, 28 Jun 2022 08:58:30 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BE4AE19466DF for <cluster-devel@listman.corp.redhat.com>;
 Tue, 28 Jun 2022 08:58:28 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 15BF3141510C; Tue, 28 Jun 2022 08:58:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 117191415108
 for <cluster-devel@redhat.com>; Tue, 28 Jun 2022 08:58:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC959185A79C
 for <cluster-devel@redhat.com>; Tue, 28 Jun 2022 08:58:27 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-8oXMb7HEOXquFy4M6eUExw-1; Tue, 28 Jun 2022 04:58:25 -0400
X-MC-Unique: 8oXMb7HEOXquFy4M6eUExw-1
Received: by mail-ej1-f45.google.com with SMTP id q6so24245224eji.13;
 Tue, 28 Jun 2022 01:58:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=weYByFyTnVPfMPS/NnD/urU6LcJtRq/Ol19ih/S3E4o=;
 b=DOjLBPC7ck8QYd9xQ6wLUHeZ9NiRNsG00XHyNVzU74n9LJJfrnHlTUdiAVBMOdfeba
 CTYixBBoUp5Nt5K3E3Inc/gs/KtVxgapAhzSQGjyjDrJ6hdpSoXT9OJ0TIol45PjTPmQ
 kq7gBZFc6jkCM7u46BpcZBKvezRtTIJLIODpU6suBeZBCndNMK+SyLaBLgDlJYpJ0D7S
 Xq9r5lHCwaVBG5lwCTolGNwZmKn+336gQGjib5PSMiOOBOaDTU4E0D90c00S30uVueow
 QqB4nLZ4nt0eK+bPMfO4lAY6yUhLLSx8nUu9xaaN99vCpKKAfx4XtA0y1yKCwwXXLrZo
 5/Eg==
X-Gm-Message-State: AJIora+4hxhO4GwGnblNF/zLotqLJNKxBBClBu8tqMuefN37b8GuxlwI
 zcKKgglM7hCDM5yII+qBI3pGBrDRJ64=
X-Google-Smtp-Source: AGRyM1vl6DbgnRcb8+XhzVRp1PSCK/CNEG9/yjT7NwV8iD9OSQLF9FY8tvWF6wcizf33P5lwOQf8GQ==
X-Received: by 2002:a17:907:7206:b0:726:abaf:16f5 with SMTP id
 dr6-20020a170907720600b00726abaf16f5mr7485542ejc.70.1656406703899; 
 Tue, 28 Jun 2022 01:58:23 -0700 (PDT)
Received: from mail (239.125-180-91.adsl-dyn.isp.belgacom.be. [91.180.125.239])
 by smtp.gmail.com with ESMTPSA id
 p17-20020a056402501100b0043787ad7cfasm4405386eda.22.2022.06.28.01.58.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 01:58:23 -0700 (PDT)
Date: Tue, 28 Jun 2022 10:58:21 +0200
From: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To: Alexander Aring <aahringo@redhat.com>
Message-ID: <20220628085821.kn3jjrviyprgai4w@mail>
References: <CAK-6q+hd-L54cqOiFNuufS2_VF5XS0R8cjQL7es8921+2u3uwQ@mail.gmail.com>
 <20220627184232.tjfuzeir57l3h5ll@mail>
 <CAK-6q+haOfQD8_N6pEm80BTrUXwaj07ZBcXP-EBHftpTVEc1XQ@mail.gmail.com>
 <CAK-6q+g795MwPvUGxWXTE+s-TfJnbh2wf=Udb1k7r6ru-4FTMQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAK-6q+g795MwPvUGxWXTE+s-TfJnbh2wf=Udb1k7r6ru-4FTMQ@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: Re: [Cluster-devel] sparse warnings related to kref_put_lock() and
 refcount_dec_and_lock()
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
Cc: linux-kernel@vger.kernel.org, cluster-devel <cluster-devel@redhat.com>,
 linux-sparse@vger.kernel.org, thunder.leizhen@huawei.com,
 jacob.e.keller@intel.com, akpm@linux-foundation.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 27, 2022 at 09:06:43PM -0400, Alexander Aring wrote:
> >
> > If we change the refcount code to _never_ calling unlock() for the
> > specific lock, then all those foo_and_lock_bar() functions can be
> > annotated with "__acquires()". This should also end in the same code?
> 
> sorry, this will not work because of the first condition of "if
> (refcount_dec_not_one(r))" which will never hold the lock if true...
> that's what the optimization is all about. However, maybe somebody has
> another idea...

I would certainly not recommend this but ...
if it's OK to cheat and lie then you can do:
+	bool refcount_dec_and_lock(refcount_t *r, spinlock_t *lock) __acquires(lock);
+
	bool refcount_dec_and_lock(refcount_t *r, spinlock_t *lock)
	{
-		if (refcount_dec_not_one(r))
-			return false;
+		if (refcount_dec_not_one(r)) {
+			__acquire(lock);
+			return false;
+		}
	
		spin_lock(lock);
		if (!refcount_dec_and_test(r)) {
			spin_unlock(lock);
+			__acquire(lock);
			return false;
		}
	
		return true;
	}

In other word, pretend that the lock is always taken but ...
1) it's ugly
2) it's lying and can be confusing
3) now all the users of this function will have an imbalance problem
   (but they probably already have one since refcount_dec_and_lock()
    is not annotated).

What is needed is some kind of annotation for conditional locks.
I've tried a few time and in itself it was working but in most
cases the usage pattern was so that there was a imbalance anyway.

-- Luc

