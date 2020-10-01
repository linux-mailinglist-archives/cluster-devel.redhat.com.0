Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id CE3BF280149
	for <lists+cluster-devel@lfdr.de>; Thu,  1 Oct 2020 16:32:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601562751;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=OYDJyc7eV7oqSSuJqRCB9vwutwFZxIQh3UYGerhCyq0=;
	b=OYI3kosxy7apgPULHWS+7X+joqXnOOOEoQNnpqWxlX7D8p5MR1Q4OPlISqsutf/dG9Cb0X
	dfWzFB+Mg5cvkR8fjoI4M6CTKwISR0bh8xZcuVdAWw42IN+6pRD71iDIXMJu6kpTe8G+dm
	67vsuFM6UK+drHXmuZ/ZpZWxHVDEYu4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-4bIVlIG0NgG2QPfTkbChBQ-1; Thu, 01 Oct 2020 10:32:30 -0400
X-MC-Unique: 4bIVlIG0NgG2QPfTkbChBQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D7C54801AEC;
	Thu,  1 Oct 2020 14:32:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C3A7C73671;
	Thu,  1 Oct 2020 14:32:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5E631181A869;
	Thu,  1 Oct 2020 14:32:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 091EWGCm001425 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 1 Oct 2020 10:32:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1B17F7367E; Thu,  1 Oct 2020 14:32:16 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.138])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A56373671
	for <cluster-devel@redhat.com>; Thu,  1 Oct 2020 14:32:15 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Thu,  1 Oct 2020 15:32:07 +0100
Message-Id: <20201001143208.1893890-2-anprice@redhat.com>
In-Reply-To: <20201001143208.1893890-1-anprice@redhat.com>
References: <20201001143208.1893890-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 2/3] gfs2_jadd: Only call exit() from main()
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Now die() can be removed from gfs2_mkfs.h

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/mkfs/gfs2_mkfs.h | 11 --------
 gfs2/mkfs/main_jadd.c | 64 +++++++++++++++++++++++++------------------
 2 files changed, 37 insertions(+), 38 deletions(-)

diff --git a/gfs2/mkfs/gfs2_mkfs.h b/gfs2/mkfs/gfs2_mkfs.h
index 75f70e6a..af0fcd50 100644
--- a/gfs2/mkfs/gfs2_mkfs.h
+++ b/gfs2/mkfs/gfs2_mkfs.h
@@ -6,17 +6,6 @@
 #include "osi_list.h"
 #include "copyright.cf"
 
-/* die() used to be in libgfs2.h */
-static __inline__ __attribute__((noreturn, format (printf, 1, 2)))
-void die(const char *fmt, ...)
-{
-	va_list ap;
-	va_start(ap, fmt);
-	vfprintf(stderr, fmt, ap);
-	va_end(ap);
-	exit(-1);
-}
-
 /* This function is for libgfs2's sake. */
 void print_it(const char *label, const char *fmt, const char *fmt2, ...)
 {
diff --git a/gfs2/mkfs/main_jadd.c b/gfs2/mkfs/main_jadd.c
index b8f1ad90..7583ba0f 100644
--- a/gfs2/mkfs/main_jadd.c
+++ b/gfs2/mkfs/main_jadd.c
@@ -141,14 +141,12 @@ static void print_usage(const char *prog_name)
 }
 
 /**
- * decode_arguments - decode command line arguments and fill in the struct gfs2_sbd
+ * Decode command line arguments and fill in the struct gfs2_sbd
  * @argc:
  * @argv:
  * @sdp: the decoded command line arguments
- *
  */
-
-static void decode_arguments(int argc, char *argv[], struct gfs2_sbd *sdp, struct jadd_opts *opts)
+static int decode_arguments(int argc, char *argv[], struct gfs2_sbd *sdp, struct jadd_opts *opts)
 {
 	int cont = 1;
 	int optchar;
@@ -166,8 +164,7 @@ static void decode_arguments(int argc, char *argv[], struct gfs2_sbd *sdp, struc
 			break;
 		case 'h':
 			print_usage(argv[0]);
-			exit(0);
-			break;
+			return 1;
 		case 'J':
 			sdp->jsize = atoi(optarg);
 			break;
@@ -181,31 +178,31 @@ static void decode_arguments(int argc, char *argv[], struct gfs2_sbd *sdp, struc
 			printf("gfs2_jadd %s (built %s %s)\n", VERSION,
 			       __DATE__, __TIME__);
 			printf(REDHAT_COPYRIGHT "\n");
-			exit(0);
-			break;
+			return 1;
 		case ':':
 		case '?':
 			fprintf(stderr, _("Please use '-h' for help.\n"));
-			exit(EXIT_FAILURE);
-			break;
+			return -1;
 		case EOF:
 			cont = 0;
 			break;
 		default:
-			die( _("Invalid option: %c\n"), optchar);
-			break;
+			fprintf(stderr, _("Invalid option: %c\n"), optchar);
+			return -1;
 		};
 	}
 
 	if (optind < argc) {
 		opts->path = argv[optind];
 		optind++;
-	} else
-		die( _("no path specified (try -h for help)\n"));
-
-	if (optind < argc)
-		die( _("Unrecognized argument: %s\n"), argv[optind]);
-
+	} else {
+		fprintf(stderr, _("no path specified (try -h for help)\n"));
+		return -1;
+	}
+	if (optind < argc) {
+		fprintf(stderr, _("Unrecognized argument: %s\n"), argv[optind]);
+		return -1;
+	}
 	if (opts->debug) {
 		printf( _("Command line arguments:\n"));
 		printf("  qcsize = %u\n", sdp->qcsize);
@@ -214,16 +211,24 @@ static void decode_arguments(int argc, char *argv[], struct gfs2_sbd *sdp, struc
 		printf("  quiet = %u\n", opts->quiet);
 		printf("  path = %s\n", opts->path);
 	}
+	return 0;
 }
 
-static void verify_arguments(struct gfs2_sbd *sdp, struct jadd_opts *opts)
+static int verify_arguments(struct gfs2_sbd *sdp, struct jadd_opts *opts)
 {
-	if (!opts->journals)
-		die( _("no journals specified\n"));
-	if (sdp->jsize < 32 || sdp->jsize > 1024)
-		die( _("bad journal size\n"));
-	if (!sdp->qcsize || sdp->qcsize > 64)
-		die( _("bad quota change size\n"));
+	if (!opts->journals) {
+		fprintf(stderr, _("no journals specified\n"));
+		return -1;
+	}
+	if (sdp->jsize < 32 || sdp->jsize > 1024) {
+		fprintf(stderr, _("bad journal size\n"));
+		return -1;
+	}
+	if (!sdp->qcsize || sdp->qcsize > 64) {
+		fprintf(stderr, _("bad quota change size\n"));
+		return -1;
+	}
+	return 0;
 }
 
 static void print_results(struct jadd_opts *opts)
@@ -607,8 +612,13 @@ int main(int argc, char *argv[])
 	sdp->qcsize = GFS2_DEFAULT_QCSIZE;
 	opts.journals = 1;
 
-	decode_arguments(argc, argv, sdp, &opts);
-	verify_arguments(sdp, &opts);
+	ret = decode_arguments(argc, argv, sdp, &opts);
+	if (ret == 1)
+		exit(0);
+	if (ret != 0)
+		exit(1);
+	if (verify_arguments(sdp, &opts) != 0)
+		exit(1);
 
 	sbd.path_fd = lgfs2_open_mnt_dir(opts.path, O_RDONLY|O_CLOEXEC, &mnt);
 	if (sbd.path_fd < 0) {
-- 
2.26.2

