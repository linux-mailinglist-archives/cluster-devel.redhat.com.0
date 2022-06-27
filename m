Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D99CC55BAAF
	for <lists+cluster-devel@lfdr.de>; Mon, 27 Jun 2022 17:15:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656342941;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=GO/MBM6YkTfuoJcYEX6KXF0OAWbbLiKRXPHLGR2ttc0=;
	b=YwAJipC/zXb+yG19LE0tgZB6FrZBu0uKpMtT7j/RpljMCEoS7jS/NVp5DANXzfPvaKAVis
	DQSdQNV+pQ1vqUs69HLdHNyaubJ7fyti2a1N1n5YVPCPjVEq8CGW9t+WYKh+eYHVAj3hS/
	6xsyuJxOIfxS/mf++PAzw1awzJowvjk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-628-S1kryRP0O4SmIpn2RIG18g-1; Mon, 27 Jun 2022 11:15:35 -0400
X-MC-Unique: S1kryRP0O4SmIpn2RIG18g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A4B601C1C1A8;
	Mon, 27 Jun 2022 15:15:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 615821121314;
	Mon, 27 Jun 2022 15:15:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D910D194704A;
	Mon, 27 Jun 2022 15:15:30 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6E79419466DF for <cluster-devel@listman.corp.redhat.com>;
 Mon, 27 Jun 2022 15:15:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5FABF1410DD8; Mon, 27 Jun 2022 15:15:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C0DB1400B19
 for <cluster-devel@redhat.com>; Mon, 27 Jun 2022 15:15:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 44B5E80029D
 for <cluster-devel@redhat.com>; Mon, 27 Jun 2022 15:15:30 +0000 (UTC)
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-500-XPnUX6o2NcSOikTV6-x1FA-1; Mon, 27 Jun 2022 11:15:28 -0400
X-MC-Unique: XPnUX6o2NcSOikTV6-x1FA-1
Received: by mail-qv1-f70.google.com with SMTP id
 x18-20020a0ce252000000b004703cbb92ebso9634779qvl.21
 for <cluster-devel@redhat.com>; Mon, 27 Jun 2022 08:15:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=GO/MBM6YkTfuoJcYEX6KXF0OAWbbLiKRXPHLGR2ttc0=;
 b=a7LgKYFsq/MsJPKLK/0BYPHzNswvGIdpVbSOembw+k64b2YB3jiNndytsdGveRJQpH
 /Gz4q7lPZN/mzzlV+xXUp/4b/exAHj8tWn9X6cCivn6Mg4wBZhzJA5SP1MvVKlL18zNo
 Pgg+ipUCA7LtCvAoLYFAgDhKkh/k+cyfxnHyZuK1dTmI8NuVMV/FFWjcuRoo+/7i9XqU
 oiFvmwo5HSY9qcFYnDolBlb4w9IcmmOanytQvRMg5pdh4KHcwfM4OCwXqxsmJ3X5Ygfv
 9215BXUZBVb8eaRK88tCGNBKS5grpTSLG7P0bjnEXZvg6iHOGFRk8axtdl9z5ZEPnTN4
 FmDg==
X-Gm-Message-State: AJIora9MyUwUSauFOBiI+9u61C9olzJDk2+IC6M5Y6p881iIgyDq34uT
 eGqs4JFUee3VyBK6fHGrLw964/2FvibYAsXLjvzFz15CstSpdeoYNLfX/XUb+3aYeUY6HDycj/h
 L2zMkVIgs2t2I7AkjEd1X1nUWy6B9BXtJW5q+Cw==
X-Received: by 2002:a05:622a:1306:b0:31a:f73e:3d6d with SMTP id
 v6-20020a05622a130600b0031af73e3d6dmr2571839qtk.339.1656342927991; 
 Mon, 27 Jun 2022 08:15:27 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sLAh5El7fzCaEzHLFipY66Dss3D0usdEJV1zsOaHo/Tcrhw9/BnSJl91k2QpDJulafVoKAuEerqqufAfMLAYY=
X-Received: by 2002:a05:622a:1306:b0:31a:f73e:3d6d with SMTP id
 v6-20020a05622a130600b0031af73e3d6dmr2571817qtk.339.1656342927725; Mon, 27
 Jun 2022 08:15:27 -0700 (PDT)
MIME-Version: 1.0
From: Alexander Aring <aahringo@redhat.com>
Date: Mon, 27 Jun 2022 11:15:17 -0400
Message-ID: <CAK-6q+hd-L54cqOiFNuufS2_VF5XS0R8cjQL7es8921+2u3uwQ@mail.gmail.com>
To: linux-sparse@vger.kernel.org
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: [Cluster-devel] sparse warnings related to kref_put_lock() and
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
Cc: cluster-devel <cluster-devel@redhat.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

I recently converted to use kref_put_lock() in fs/dlm subsystem and
now I get the following warning in sparse:

warning: context imbalance in 'put_rsb' - unexpected unlock

It seems sparse is not able to detect that there is a conditional
requirement that the lock passed to kref_put_lock() (or also
refcount_dec_and_lock()) is locked or not. I evaluate the return value
to check if kref_put_lock() helds the lock and unlock it then. The
idea is that the lock needs only to be held when the refcount is going
to be zero.

It seems other users unlock the lock at the release callback of
kref_put_lock() and annotate the callback with "__releases()" which
seems to work to avoid the sparse warning. However this works if you
don't have additional stack pointers which you need to pass to the
release callback.

My question would be is this a known problem and a recommended way to
avoid this sparse warning (maybe just for now)?

Thanks.

- Alex

